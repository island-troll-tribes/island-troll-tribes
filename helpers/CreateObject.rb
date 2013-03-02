module CreateObject

  OBJECT_TYPES = {
     "units"         => "w3u",
     "items"         => "w3t",
     "destructables" => "w3b",
     "doodads"       => "w3d",
     "abilities"     => "w3a",
     "buffs"         => "w3h",
     "upgrades"      => "w3q"
  }.freeze

  def create_object(type, baseid, custid, properties)
    jass = "//! externalblock ObjectMerger #{OBJECT_TYPES[type.downcase]} #{baseid} #{custid} #{properties.map{|p,v|p+" "+[v].flatten.map{|s|if s.class.name != "String" then s else '"'+s+'"' end}.join(" ")}.join(" ")} |\n"
  end

  def create_item(baseid, custid, properties)
    create_object("items", baseid, custid, properties)
  end

  def create_unit(baseid, custid, properties)
    create_object("units", baseid, custid, properties)
  end
end
