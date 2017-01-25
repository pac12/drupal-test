# Pac-12 Drupal Technical Test

The goal of this evaluation is to gauge your current knowledge of Drupal and
related technologies as a web developer. There are no _right_ or _correct_
solutions for this evaluation. Just be sure to do your best and ask questions
if you are unsure or stuck on something. The resulting module will go through a
code review where choices and implementation details can be discussed.

The development portion of this evaluation is expected to take approx. 3-4 hours
to complete . Times to completion will vary widely depending on experience. You
will be able to get your development environment setup prior to beginning this
evaluation.

You are also encouraged to ask questions and interact with the other developers
during this evaluation. At the end of the evaluation you will turn in your
completed `filtered_videos` module for review.


Dependencies
============

This evaluation requires a working development environment with Web Server, PHP
& MySQL installed. In order to complete this evaluation, you will need to have
the following setup on your local development environment.

1. a web server running:
  * PHP
  * MYSQL
2. Drush installed globally

Below is the development environment we currently are running. You do not need
to have the same environment for your local development machine, j  ust ensure
you can setup a new PHP/MYSQL website and it meets the minimum requirements
needed to run Drupal 7.

1. nginx version: nginx/1.10.1
2. MySQL Server version: 5.7.14 Homebrew
3. Drush Version: 8.1.3
4. PHP: 5.6.24

### Communication
During the evaluation, we will be using Slack to communicate. You will be given
an invite to the Slack channel before the evaluation. If you do not have Slack,
it can be downloaded here: https://slack.com/downloads


Setup Basic Drupal Installation
===============================

Use the instructions below to get a standard Drupal install running on your
development machine

### Fork & Clone the Repository
1. Fork this repository to make your own copy.
2. Clone the Fork to ~/src/drupal-test.dev/

### Setup:
1. Create a new Virtual Host for your web server to run this evaluation.
  * Set the domain as drupal-test.dev or something similar.
  * Set the root directory to `~/src/drupal-test.dev/htdocs`
2. Create a new mysql database.
  * Name the new database `drupal_test_dev`

### Install Drupal:
1. Run the Drush make file `pac12.make` to install drupal and required modules.
  * The destination for the make file should be `~/src/drupal-test.dev/htdocs`
2. Using Drush, run a standard install Drupal. Specify the Database URL, User
   & Password to ensure a settings.php file is generated for you.
3. Enable modules
  * Features
  * jQuery Update
4. Navigate to the site to ensure that everything is running.


Develop a Module
================

Now that Drupal is up and running and the required modules have been installed,
we will outline the requirements to be completed for this evaluation. We will be
creating a new content type, modifying the node edit form for the content type
and adding some front end functionality to it.

### Create a Content Type
1. Create a content type, `Filtered Videos`
  * Make sure the machine name is `filtered_videos`
2. Add the following fields:
  * `Auto Fetch`
    * Field Type: `Boolean`
    * Widget: `Single On/Off checkbox`
  * `School`
    * Field Type: `List (Integer)`
    * Widget: `Select List`
    * Allowed Values:

      ```
      9|Arizona
      15|Arizona State
      10|California
      16|Colorado
      17|Oregon
      18|Oregon State
      19|Stanford
      20|UCLA
      21|USC
      22|Utah
      23|Washington
      34|Washington State
      ```
  * Sport
    * Field Type: `List (Integer)`
    * Widget: `Select List`
    * Allowed Values:

      ```
      6|Baseball
      7|Men's Basketball
      36|Women's Basketball
      8|Football
      ```

### Featurize the Content Type
1. Featurize Content Type `Filtered Videos`
  * Name: `Filtered Videos`
  * Description: Filtered Videos Drupal Evaluation Module
  * Package: Drupal Test
  * Version: 7.x-1.0
2. Either generate or download the feature so that you can further extend it.
3. Place the new feature into the `sites/all/modules` folder of your Drupal
   install.
4. Enable the `filtered_videos` module using drush.

### Extend the Feature Module

##### Create a new node template for the filtered_videos content type
1. Create a node override template for the `filtered_videos` content type.
  * This template should replace the `node.tpl.php` template when viewing this
    content type.
2. In the new node template, do the following:
  * Remove the render calls and their surrounding elements for submitted
    metadata, contents, comments & links.
  * Add an HTML button
    * Give the button a unique identifier.
  * Add an HTML div under the button
    * Give the div a unique identifier.


##### Attach needed JS & settings.
1. Create an empty javascript file inside of the module.
  * Name the file `filtered-videos.js`
2. Attach the `filtered-videos.js` file to the page when viewing a
   `filtered_videos` content type.
3. Attach javascript settings to the page when viewing a `filtered_videos`
   content type.
  * In the settings, expose the following fields of the `filtered_videos`
    content type.
    * `Auto Fetch`, `School` & `Sport`

##### Create a Drupal Behavior
1. In the `filtered-videos.js` file, add a new Drupal behavior.
  * Wrap the behavior in a javascript closure that passes a reference to jQuery.
2. When the button in the template is clicked, display a list of videos then
   hide the button.
  * Use the VOD API to fetch a list of videos via AJAX.
    * http://docs.pac12v3.apiary.io/#reference/vod
  * For each VOD display a thumbnail linked to its URL.
    * Include an alt tag in the image with the VODs title.
    * Include a title tag on the link with the VODs title.
3. If `Auto Fetch` is set to true, automatically trigger the above logic and
   hide the button.

### Commit your work
1. Once you have completed the evaluation, commit the entire htdocs directory
   into your repository.
2. Push your commits up to your fork of the repository.
3. You are encouraged to make incremental commits as you work through the
   evaluation outlining and describing the changes being committed.

##### Optionally

The below optional tasks are not required for this evaluation. If you complete
the evaluation ahead of time and would like to try and implement these
additional features, you are encouraged to do so.

1. Provide next/previous links to navigate between the pages of VODs returned
   by the API.
2. Display VOD titles and descriptions under linked thumbnails.
3. Attach a CSS file to the `filtered_videos` content type and stylize the list
   of thumbnails.
