#!/usr/bin/env ruby

# import required libraries
require 'json'
require 'time'

# read and parse each JSON file
Dir['artworks/*.json'].each do |filename|
  data =JSON.parse(File.read(filename))

  # iterate all records
  data['records'].each do |record|

    # iterate all datings within the record
    record['datings'].each do |dating|

      # add the year as from/to average
      avg = (dating['from_day'] + dating['to_day']) / 2
      dating['year'] = Date.jd(avg.to_i).year
    end
  end

  # write the results back to the file
  File.open filename, 'w' do |f|
    f.write JSON.dump(data)
  end
end
