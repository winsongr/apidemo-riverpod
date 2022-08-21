import 'package:apidemo/pdfpreview.dart';
import 'package:apidemo/product_model.dart';
import 'package:apidemo/product_provider.dart';
import 'package:apidemo/product_repository.dart';
import 'package:apidemo/provider_registeration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  late ProductProvider productProviderRef;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      productProviderRef.getProductData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(builder: ((context, ref, child) {
          productProviderRef = ref.watch(productProvider);
          return ListView.builder(
            itemCount: productProviderRef.productList.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  
                },
                child: CheckboxListTile(
                  subtitle:
                      Text(productProviderRef.productList[index].id.toString()),
                  title: Text(
                      productProviderRef.productList[index].title.toString()),
                  secondary: CircleAvatar(
                    backgroundImage: NetworkImage(
                        productProviderRef.productList[index].image.toString()),
                  ),
                  onChanged: (bool? value) {
Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PdfPreviewPage(
                        product: productProviderRef.productList[index],
                      ),
                    ),
                  );
                  },
                  value: true,
                ),
              );
            }),
          );
        })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("object" * 100);

            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => PdfPreviewPage(),
            //   ),
            // );
          },
          child: Icon(Icons.picture_as_pdf),
        ));
  }
}
