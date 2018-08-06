# Project Title

Bacula Outage Tool

## Getting Started

Sometimes, I had to do some intervention on Bacula, but some backups were running.
I needed to cancel all backups, perform maintenance, and soon after, see which backups would have to run again.

bacula-outage helps you with this work, automating the entire process.

### Prerequisites

You need to have the Bacula environment up and running

### Installing

Download the bacula-outage.sh file and configure the global variables

```
BOF=$HOME/bacula-outage-jobs-to-run.txt   # Where the jobs running will be save
CATJOB=MyCatalog   # Your Bacula catalog name
```


Download the bacula-outage.sh file and put them in your system

```
mv bacula-outage.sh /usr/sbin/bacula-outage
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
