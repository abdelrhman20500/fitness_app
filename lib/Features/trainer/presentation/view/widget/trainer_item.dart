import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrainerItem extends StatelessWidget {
  const TrainerItem({super.key, required this.imageUrl, required this.title, required this.experienceYears, required this.specialty, required this.rating, });
  final String imageUrl;
  final String title;
  final int experienceYears;
  final String specialty;
  final double rating;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: height*0.2,
      decoration: BoxDecoration(
        color: const Color(0xFF0B1526),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(
            width: width*0.4,
            height: height*0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                height: height * 0.25, // Adjust height
                width: double.infinity, // Full width
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(
                    height: height * 0.2,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white,),
                    maxLines: 1,overflow: TextOverflow.ellipsis,),
                      Text(specialty,
                    style: const TextStyle(fontSize: 16, color: Colors.grey,),
                    maxLines: 2,overflow: TextOverflow.ellipsis,),
                  Row(
                    children: [
                      Text("($experienceYears)  experience", style: const TextStyle(color: Colors.grey, fontSize: 16),),
                      SizedBox(width: width*0.06),
                      const Icon(Icons.star_border_outlined, color: Colors.amber, size: 20),
                      SizedBox(width: width*0.02),
                      Text("(${rating.toString()})",style: const TextStyle(color: Colors.grey, fontSize: 17),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}