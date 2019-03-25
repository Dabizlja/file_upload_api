json.total_records @records.size
json.records @records.each do |record|
  json.uuid record.id
  json.name record.name
end

json.related_records @related_records do |rel_records|
  json.name rel_records.name
end