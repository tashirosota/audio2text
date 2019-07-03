require "google/cloud/speech"
require "google/cloud/storage"

# upload to google cloud strage
storage = Google::Cloud::Storage.new project_id: 'Speech-to-Text'
bucket  = storage.bucket 'taskey-interview'

puts '====Upload flac file to GoogleCloudStorage===='
file = bucket.create_file("#{ARGV[0]}.flac")

# speech to text
speech = Google::Cloud::Speech.new

config = {
    encoding:          :FLAC,
    sample_rate_hertz: 16000,
    language_code:     "ja-JP"
}
audio  = { uri: "gs://taskey-interview/#{ARGV[0]}.flac" }
puts '====👏👏👏Finished👏👏👏===='
puts '====Convert flac file to text file===='

operation = speech.long_running_recognize config, audio

puts "====Operation started===="
puts "====Wait until done===="

operation.wait_until_done!

raise operation.results.message if operation.error?

results = operation.response.results


texts = results.map { |obj| obj.alternatives.first.transcript }

File.write("#{ARGV[0]}.txt", texts.join("\n"))

puts '====👏👏👏Finished👏👏👏===='


