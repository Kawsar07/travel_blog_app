class Travel {
  String name ;
  String location;
  String url;
  Travel(this.name, this.location, this.url);
  static List<Travel>generateTravelBlog(){
    return [
      Travel('Place1', 'Place1', 'assets/images/top1.jpg'),
      Travel('Place2', 'Place2', 'assets/images/top2.jpg'),
      Travel('Place3', 'Place3', 'assets/images/top3.jpg'),
      Travel('Place4', 'Place4', 'assets/images/top4.jpg'),
    ];
  }

  static List<Travel>generateMostPopular(){
    return [
      Travel('Place5', 'Place5', 'assets/images/bottom1.jpg'),
      Travel('Place6', 'Place6', 'assets/images/bottom2.jpg'),
      Travel('Place7', 'Place7', 'assets/images/bottom3.jpg'),
      Travel('Place8', 'Place8', 'assets/images/bottom4.jpg'),
    ];
  }
}