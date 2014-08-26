#! /usr/bin/env ruby
$: << '../lib'
require 'crunchbase'
require 'yaml'

yaml = YAML.load_file('apikey.yml')

Crunchbase::API.key = yaml['key']
Crunchbase::API.debug = yaml['debug']
