import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPages extends StatefulWidget {
	@override
	SwiperPageState createState() {
		return SwiperPageState();
	}
}

class SwiperPageState extends State<SwiperPages> {
  	@override
  	Widget build(BuildContext context) {
    return Scaffold(
		body: Container(
			width: MediaQuery.of(context).size.width,
			height: 200.0,
			child: Swiper(
				itemBuilder: _swiperBuilder,
				itemCount: 3,
				pagination: new SwiperPagination(
					builder: DotSwiperPaginationBuilder(
						color: Color.fromRGBO(250, 250, 250, 0.7),
						activeColor: Colors.white,
					)
				),
				scrollDirection: Axis.horizontal,
				autoplay: true,
            	onTap: (index) => print('点击了第$index个'),
        	)
		),
    );
}

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.asset(
      "lib/assets/images/home_banner1.png",
      fit: BoxFit.fill,
    ));
  }
}