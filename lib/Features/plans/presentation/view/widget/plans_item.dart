import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlansItem extends StatelessWidget {
  const PlansItem({super.key, required this.imageUrl, required this.id, required this.title, required this.level, required this.description, required this.durationWeeks});
  final String imageUrl;
  final int id;
  final String title;
  final String level;
  final String description;
  final int durationWeeks;

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1E2937),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Stack(
            children: [
              ClipRRect(
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
              // Advanced Badge
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(level,
                    style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold, letterSpacing: 0.5,),),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(title,
                        maxLines: 1,overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white,),),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, color: Colors.grey, size: 18),
                        SizedBox(width: width*0.02),
                        Text("$durationWeeks Weeks", style: const TextStyle(color: Colors.grey, fontSize: 14),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height*0.01),
                Text(description, style: const TextStyle(color: Colors.grey, fontSize: 14),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}