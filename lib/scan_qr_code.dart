import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult= "Scanned Data will appear here";
  Future<void>scanQR()async{
    try{
      final QrCode = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel",true, ScanMode.QR); 
      if(!mounted)return;
      setState(() {
        this.qrResult =QrCode.toString();
      });
    }on PlatformException{
      qrResult="Fail to read QR Code";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("QR Code Scanner"),),
    body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 38,),
          Text("$qrResult",style: TextStyle(color: Colors.black),),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: scanQR, child: Text("Scan Code"))
        ],
      ),
    ) ,
    
    );
  }
}