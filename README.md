# OnlineAuctionSystem
 is a system that allow users to set up their products for auctions and bidders to register and bid for various products available for bidding.
#### Ruby version
ruby 2.7


#### Rails version
rails 5.2


### System dependencies


#### Configuration
* Make sure to have ruby installed. You can check by running following command:
```console
$ ruby -v
```
* Make sure to have rails installed as well.
```console
$ rails -v
```
* Install and enable postgresql.
```console
$ sudo yum install postgresql-server postgresql-contrib
```
* Create postgres database cluster.
```console
$ sudo postgresql-setup initdb


```
* Install necessary gems.
```console
$ bundle install


```
* Run following data to initialize DB with seed admin.
```console
$ rails db:seed


```
* Run Rails server.
```console
$ rails s


```
