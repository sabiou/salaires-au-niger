## Getting started

To get started with the app, clone the repo and then install the needed gems. You can clone the repo as follows:

```
$ git clone https://github.com/sabiou/salaires-au-niger.git
$ cd salaires-au-niger
```

To install the gems, you will need the same versions of Ruby and Bundler used to build the sample app, which you can find using the `cat` and `tail` commands as follows:

```
$ cat .ruby-version
<Ruby version number>
$ tail -n1 Gemfile.lock
   <Bundler version number>
```

Next, install the versions of `ruby` and the `bundler` gem from the above commands. The Ruby installation is system-dependent; on the cloud IDE recommended in the tutorial, it can be installed as follows:

```
$ rvm get stable
$ rvm install <Ruby version number>
$ rvm --default use <Ruby version number>
```

Then the rest of the necessary gems can be installed with `bundle` (taking care to skip any production gems in the development environment):

```
$ gem install bundler 
$ bundle config set --local without 'production'
$ bundle install
```

If you run into any trouble, you can remove `Gemfile.lock` and re-bundle at any time:

```
$ rm -f Gemfile.lock
$ bundle install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you’ll be ready to seed the database with sample salaries and run the app in a local server:

```
$ rails db:seed
$ rails server
```