CDX to OpenMRS Connector
========================

This connector allows to register Sample IDs and results to a patient's encounter in an OpenMRS system through its RESTful API.

## Setup

This is a tiny Rails application, so you should `git clone` and `bundle install` it.

Before running it, you should create a few things in OpenMRS:

1. Create a Concept Class called `SampleID` (at `http://OPENMRS_HOST/openmrs-standalone/admin/concepts/conceptClass.form`).

2. Create another Concept Class called `SampleResult`.

3. Create a Concept called `SampleID` (at `http://OPENMRS_HOST/openmrs-standalone/dictionary/concept.form`) with Class `SampleID` and datatype `Text`. **Register its UUID** on `config/settings.yml` as the `sample_id_concept_uuid` field.

4. Create a Concept called `SampleResult` with Class `SampleResult` and datatype `Text`. Register it as `sample_result_concept_uuid` in `config/settings.yml`.

5. Correctly fill the `openmrs_base_url` to match your host in `config/settings.yml`.

Now you're done to just `rails s` your app.

## Subscription

Set up a subscription in CDX to URL `http://CDX-OPENMRS-CONNECTOR-HOST/openmrs/result` with verb `GET`, no auth, and all fields selected. This will push all the filtered events to this app, which will insert the result data into OpenMRS. The connector will make use of the fields `sample_id` and `result`, make sure they are properly defined in your CDX instance.

## Workflow

1- Register a new patient in OpenMRS in the _Register a patient_ menu.

2- Create a new visit for the patient in OpenMRS from the _Active Visits_ menu.

3- Add a visit note in OpenMRS for the visit from the _Visit Note_ action in the _Current Visit Actions_ menu of the visit details page.

4- In the cdx-openmrs-connector app, search the patient by name, select the Visit, and enter the `sample_id` to be used in CDX for this patient test.

5- Run the test and upload it to CDX.
