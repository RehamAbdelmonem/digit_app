import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/shared/components/constants.dart';

class RateLaboratories extends StatefulWidget {
    late String labId;

    RateLaboratories(this.labId);

  @override
  _RateLaboratoriesState createState() => _RateLaboratoriesState();
}

class _RateLaboratoriesState extends State<RateLaboratories> {

  int _rating=0;

  void _setRating(int value) {
    setState(() {
      _rating = value;
    });
    FirebaseFirestore.instance.collection("labs")
    .doc(widget.labId)
    .collection("rating")
    .doc(myId)
    .set({"rate":_rating});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.labId);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("labs")
        .doc(widget.labId).collection("rating").snapshots(),
      builder: (context, snapshot) {
        int count=0;
        num rate=0;
        if(snapshot.hasData) {
          for (var element in snapshot.data!.docs) {
            count++;
           rate+= element.get("rate");

          }
          int rating =((rate+_rating)/(count+1)).ceil();
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  child: Text(
                    "التقييم: $rating",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.blue.shade900),
                  ),
                ),
                const SizedBox(width: 15,),
                Icon(Icons.star_rate_rounded,
                color: rating >= 1 ? Colors.yellow : Colors.black,
                ),
                Icon(Icons.star_rate_rounded,
                color: rating >= 2 ? Colors.yellow : Colors.black,
                ),
                Icon(Icons.star_rate_rounded,
                color: rating >= 3 ? Colors.yellow : Colors.black,
                ),
                Icon(Icons.star_rate_rounded,
                color: rating >= 4 ? Colors.yellow : Colors.black,
                ),
                Icon(Icons.star_rate_rounded,
                color: rating >= 5 ? Colors.yellow : Colors.black,
                ),


              ],
            ),
            if(myId!=null)
            Row(
              children: [
                Container(
                  child: Text(
                    "اضافة تقييم: ${_rating}",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                  width: 35,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.star_rate_rounded),
                    onPressed: () => _setRating(1),
                    color: _rating >= 1 ? Colors.yellow : null,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.star_rate_rounded),
                  onPressed: () => _setRating(2),
                  color: _rating >= 2 ? Colors.yellow : null,
                ),
                IconButton(
                  icon: const Icon(Icons.star_rate_rounded),
                  onPressed: () => _setRating(3),
                  color: _rating >= 3 ? Colors.yellow : null,
                ),
                IconButton(
                  icon: const Icon(Icons.star_rate_rounded),
                  onPressed: () => _setRating(4),
                  color: _rating >= 4 ? Colors.yellow : null,
                ),
                IconButton(
                  icon: const Icon(Icons.star_rate_rounded),
                  onPressed: () => _setRating(5),
                  color: _rating >= 5 ? Colors.yellow : null,
                ),
              ],
            ),
            const SizedBox(height: 15.0),
          ],
        );
        }
        return const CircularProgressIndicator();
      }
    );
  }

}







//Rehaaaaaaaaaam