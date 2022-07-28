# Turnip Turnup
## Overview
This project was inspired by similar, significantly more popular projects such as [Turnip.Exchange](https://turnip.exchange), and aimed to be a small, manageable system for the 30+ people at my job at the time who were all playing Animal Crossing: New Horizons. This is a very simple Rails app that allows users to create a "Sale" when turnip prices in the game's stock market simluation are high on their island. Sales would then implement a FIFO queue system that would provide the Dodo Code needed to visit the "host" island for the sale to the user at the front of the queue.

I developed this system in roughly one evening as a fun project that also allowed me to tinker a bit with Devise. This app was deployed on a free Heroku dyno and used a few times to successfully allow people to visit one anothers' islands.

## The Problem
Prior to this, people would simply post messages in Slack advertising good turnip prices on their islands and share a code that others could use to visit their island. However, the game has a number of limitations for using these codes:
* There is a maximum number of visitors on an island at any given time
* The game would interrupt all users on the island any time another user was "arriving" or "leaving" with an animation, meaning it took significantly longer to visit and sell your turnips if others were visiting at the same time
* If two users attempted to use a Dodo Code at the same time, both would fail to be able to visit the island

To address this problem, Turnip Turnup only makes the Dodo Code for the host island of a sale visible to a single user at a time, meaning that user could visit the island, sell their turnips, and leave without any cutscene interruptions or issues due to collisions of simultaneous attempts to enter a Dodo Code.

## Usage
Users must create an account in the system (I used the [Devise](https://github.com/heartcombo/devise) gem to facilitate user auth) and then log in to view any Sales. Any user can create a Sale and enter the current turnip price on their island, which is visible to all users along with a count of how many users are currently in the queue for that sale. Any user interested in visiting the Sale's host island can then add themselves to a queue and periodically refresh the page to check their position in line. As each "current visitor" finishes their visit to the island, they simply click "Leave Queue" to relinquish their spot and allow the next person in the queue to view the Dodo Code and visit the island!
