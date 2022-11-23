require 'json'
class Store
    @info = "#{info}.json"
    write([]) unless Info.info?(@info)
end
def read
data = Info.read(@info)
    JSON.parse(data)
end
def write(data)
    json=JSON.generate(data)
    Info.write(@info,json)
end
