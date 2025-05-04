import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_application/Controller/notes_controller.dart';

class LikedNotesPage extends StatelessWidget {
  const LikedNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.find();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Your Liked Notes',
          style: TextStyle(
            color: Colors.purpleAccent,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Obx(() {
        final likedNotes =
            noteController.notes.where((note) => note.isFavorite).toList();

        if (likedNotes.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Colors.white24,
                  size: 80.sp,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'No liked notes yet...',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemCount: likedNotes.length,
          separatorBuilder: (_, __) => SizedBox(
            height: 12.h,
          ),
          itemBuilder: (context, index) {
            final note = likedNotes[index];
            final formattedDate =
                DateFormat('dd MMM, yyyy – hh:mm a').format(note.createdAt);

            return Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade800.withOpacity(0.85),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    note.content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formattedDate,
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 12.sp,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () {
                          noteController.deleteNote(note.id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
