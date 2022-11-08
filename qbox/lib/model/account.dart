class Account {
  String? name;
  String? username;
  String? email;
  String? address;
  String? phone;
  String? website;
  String? company;
  String? id;

  Account(
      {this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company,
      this.id});

  Account.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    website = json['website'];
    company = json['company'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['company'] = this.company;
    data['id'] = this.id;
    return data;
  }
}
