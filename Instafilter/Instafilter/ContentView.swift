//
//  ContentView.swift
//  Instafilter
//
//  Created by Christian Mitteldorf on 24/11/2019.
//  Copyright © 2019 mitteldorf. All rights reserved.
//

import SwiftUI
import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {

    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    @State private var filterIntensity = 0.5

    @State private var showingImagePicker = false
    @State private var showingFilterSheet = false

    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()

    let context = CIContext()

    var body: some View {
        let intensity = Binding<Double>(
            get: {
                self.filterIntensity
        }, set: {
            self.filterIntensity = $0
            self.applyProcessing()
        })

        return NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)

                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }

                HStack {
                    Text("Intensity")
                    Slider(value: intensity)
                }.padding(.vertical)

                HStack {
                    Button("Change filter") {
                        self.showingFilterSheet = true
                    }

                    Spacer()

                    Button("Save") {
                        guard let processedImage = self.processedImage else { return }

                        let imageSaver = ImageSaver()
                        imageSaver.onSuccess = {
                            print("Succes!")
                        }
                        imageSaver.onError = {
                            print("Opps: \($0.localizedDescription)")
                        }
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(title: Text("Select a filter"), buttons: [
                    .default(Text("Crystallize")) { self.setFilter(CIFilter.crystallize()) },
                    .default(Text("Edges")) { self.setFilter(CIFilter.edges()) },
                    .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur()) },
                    .default(Text("Pixellate")) { self.setFilter(CIFilter.pixellate()) },
                    .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone()) },
                    .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask()) },
                    .default(Text("Vignette")) { self.setFilter(CIFilter.vignette()) },
                    .cancel()
                ])
            }
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }

        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }

    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }

    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }

        guard let outputImage = currentFilter.outputImage else { return }

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
}

//struct ContentView: View {
//
//    @State private var image: Image?
//    @State private var inputImage: UIImage?
//    @State private var showingImagePicker = false
//
//    var body: some View {
//        VStack {
//            image?
//            .resizable()
//            .scaledToFit()
//
//            Button("Select image") {
//                self.showingImagePicker = true
//            }
//        }
//        .sheet(isPresented: $showingImagePicker, onDismiss: loadPickerImage) {
//            ImagePicker(image: self.$inputImage)
//        }
//    }
//
//    func loadPickerImage() {
//        guard let inputImage = inputImage else { return }
//        image = Image(uiImage: inputImage)
//
//        let imageSaver = ImageSaver()
//        imageSaver.writeToPhotoAlbum(image: inputImage)
//    }
//
//    func loadImage() {
//        guard let inputImage = UIImage(named: "example") else { return }
//        let beginImage = CIImage(image: inputImage)
//
//        let context = CIContext()
//
////        let currentFilter = CIFilter.sepiaTone()
////        currentFilter.inputImage = beginImage
////        currentFilter.intensity = 1
//
////        let currentFilter = CIFilter.pixellate()
////        currentFilter.inputImage = beginImage
////        currentFilter.scale = 100
//
////        let currentFilter = CIFilter.crystallize()
////        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
////        currentFilter.radius = 200
//
//        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
//        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
//        currentFilter.setValue(2000, forKey: kCIInputRadiusKey)
//        currentFilter.setValue(CIVector(x: inputImage.size.width/2, y: inputImage.size.height/2), forKey: kCIInputCenterKey)
//
//        guard let outputImage = currentFilter.outputImage else { return }
//
//        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
//            let uiImage = UIImage(cgImage: cgImage)
//            image = Image(uiImage: uiImage)
//        }
//    }
//}

//struct ContentView: View {
//    @State private var showingActionSheet = false
//    @State private var backgroundColor = Color.white
//    @State private var blurAmount: CGFloat = 0 {
//        didSet {
//            print("New value is \(blurAmount)")
//        }
//    }
//
//    var body: some View {
//        let blur = Binding<CGFloat>(
//            get: {
//                self.blurAmount
//            },
//            set: {
//                self.blurAmount = $0
//                print("New value is \(self.blurAmount)")
//            })
//
//        return VStack {
//            Text("Hello, World!")
//                .blur(radius: blurAmount)
//                .background(backgroundColor)
//                .onTapGesture {
//                    self.showingActionSheet = true
//            }
//            .actionSheet(isPresented: $showingActionSheet) {
//                ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
//                    .default(Text("Red")) { self.backgroundColor = .red },
//                    .default(Text("Green")) { self.backgroundColor = .green },
//                    .default(Text("Blue")) { self.backgroundColor = .blue },
//                    .cancel()
//                ])
//            }
//
//            Slider(value: blur, in: 0...20)
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
