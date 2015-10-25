# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Myapp.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Myapp.Repo.insert!(%Myapp.User{
  name: "Pratik Khadloya",
  email: "tispratik@gmail.com",
  crypted_passwd: Comeonin.Bcrypt.hashpwsalt("pratik")
})

Myapp.Repo.insert!(%Myapp.User{
  name: "Vinti Maheshwari",
  email: "vinti.uiet@gmail.com",
  crypted_passwd: Comeonin.Bcrypt.hashpwsalt("vinti")
})

Myapp.Repo.insert!(%Myapp.Org{
  name: "Love and Laughter",
  domain: "foo.daycayr.dev",
  license: "0101010101",
  address: "899 Rubis Dr, Sunnyvale, CA 94087",
  email: "parryg@hotmail.com",
  phone1: "408-689-2125",
  phone2: "",
  fax: "",
  facebook_url: "",
  twitter_handle: "",
  yelp_url: "http://www.yelp.com/biz/love-and-laughter-daycare-sunnyvale"
})

Myapp.Repo.insert!(%Myapp.Org{
  name: "Manmeet Daycare & After School",
  domain: "bar.daycayr.dev",
  license: "434412037",
  address: "814 Selkirk Place, Sunnyvale CA 94087",
  email: "manmeetdaycare17@gmail.com",
  phone1: "408-348-4847",
  phone2: "",
  fax: "408-852-7071",
  facebook_url: "",
  twitter_handle: "",
  yelp_url: "http://www.yelp.com/biz/manmeet-daycare-sunnyvale"
})
