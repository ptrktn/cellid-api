# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

# Example of a row in OpenCellID data.
# LTE,441,10,45060,257415168,-1,135.332863,34.388399,1000,57,1,1552867238,1575588586,0


if ENV['OPENCELLID_DATA_DIR'] && Dir.exist?(ENV['OPENCELLID_DATA_DIR'])
  Dir[File.join(ENV['OPENCELLID_DATA_DIR'], '*.csv')].each do |fname|
    puts "Processing #{fname}"
    data = CSV.read(fname)
    data.each do |row|
      Cell.create!(
        mcc: row[1],
        mnc: row[2],
        lac: row[3],
        cid: row[4],
        longitude: row[6],
        latitude: row[7]
      )
    end
  end
else
  puts "OpenCelliD data directory is undefined"
end
