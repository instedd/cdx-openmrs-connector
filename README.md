CDP<->OpenMRS Connector
=======================

This connector allows to register Sample IDs and results to a patient's encounter in an OpenMRS system through it's RESTful API.

## Setup

This is a tiny Rails application, so you should `git clone` and `bundle install` it.

Before running it, you should create a few things in OpenMRS:

1 - Create a Concept Class called `SampleID` (at `http://OPENMRS_HOST/openmrs-standalone/admin/concepts/conceptClass.form`)
2 - Create another Concept Class called `SampleResult`
3 - Create a Concept called `SampleID` (at `http://localhost:8081/openmrs-standalone/dictionary/concept.form`) with Class `SampleID` and datatype `Text`. **Register it's UUID** on `app/config/settings.yml` as the `sample_id_concept_uuid` field
4 - Create a Concept called `SampleResult` with Class `SampleResult` and datatype `Text`. Register it as `sample_result_concept_uuid`.
5 - Correctly fill the `openmrs_base_url` to match your host

Now you're done to just `rails s` your app.
