//
//  QRCodeScanner.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI
import AVFoundation

struct QRCodeScanner: View {
    @State private var scannedQRCode: String?
    @State private var isShowingScanner: Bool = false
    var body: some View {
        ZStack {
            Color("primary")
                .ignoresSafeArea()
            VStack {
                if let qrCode = scannedQRCode {
                    Text("Scanned QR Code: \(qrCode)")
                        .font(.title)
                        .foregroundColor(.black)
                } else {
                    Text("QR Code Scanner")
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                ScannerView(scannedCode: $scannedQRCode)
            }
            .onAppear {
                isShowingScanner = true
            }
        }
    }
}

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String?
    
    func makeUIViewController(context: Context) -> ScannerViewController {
        let scannerViewController = ScannerViewController()
        scannerViewController.completionHandler = { code in
            scannedCode = code
        }
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
        // Update the view controller if needed
    }
}

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var completionHandler: (String) -> Void = { _ in }
    private let session = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .userInitiated).async {
            guard let frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
                  let input = try? AVCaptureDeviceInput(device: frontCamera) else {
                print("Failed to access the front camera.")
                return
            }
            
            self.session.beginConfiguration()
            
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }
            
            let metadataOutput = AVCaptureMetadataOutput()
            if self.session.canAddOutput(metadataOutput) {
                self.session.addOutput(metadataOutput)
                
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.qr]
            }
            
            self.session.commitConfiguration()
            
            DispatchQueue.main.async {
                let previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.frame = self.view.layer.bounds
                self.view.layer.addSublayer(previewLayer)
            }
            
            self.session.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.session.stopRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        DispatchQueue.global(qos: .userInitiated).async {
            self.session.stopRunning()
            
            if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
               let qrCodeValue = metadataObject.stringValue {
                DispatchQueue.main.async {
                    self.completionHandler(qrCodeValue)
                    self.dismiss(animated: true)
                }
            }
        }
    }
}

struct QRCodeScanner_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScanner()
    }
}
