## README

This is an event repository service for collecting events from remote devices. 
The goal of this service is to allow distributed detection for things that require 
large distances between individual detectors.

This service, as of now, does not do any processing of the data, it merely records any
event on the device, and leaves it to other services to do interpretation.

## API

Create Device:

POST to /devices with parameters: 
  device[name] = simple name of device
  device[owner] = name of person in charge of device
  device[serial_number] = serial number of device
  device[latitude] = latitude of device
  device[longitude] = longitude of device

This returns a JSON object that also has a server-generated token that should be used for future requests.

Create Event:

POST to /events with the parameters:
  serial_number = serial number of device
  token = token for device
  event[event_data_base64] = base64 encoding of event data (it actually can be any string)
  event[detected_at] = the timestamp on the detector of the event
  event[latitude] = the latitude of the event (this defaults to latitude of detector if not provided)
  event[longitude] = the longitude of the event (this defaults to the longitude of detector if not specified)

Returns a JSON object representing the event
