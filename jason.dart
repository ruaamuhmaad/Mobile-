_getNetworkImage() async {
 final endpointUrl = Uri.parse('https://picsum.photos/v2/list');

 // Make the GET request
 final response = await http.get(endpointUrl);
 final decodedList = jsonDecode(response.body) as List;
 List<PixelFormImage> imageList = decodedList.map((item) {
    return PixelFormImage.fromJson(item);
 }).toList();
 print(imageList);
}
