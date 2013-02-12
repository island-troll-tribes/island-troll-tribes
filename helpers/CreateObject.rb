
module CreateObject
  def create_object(type, baseid, custid, properties)
    jass = <<-EOS
    
//! externalblock extension=lua ObjectMerger $FILENAME$
  //! i setobjecttype("#{type}")
  //! i createobject("#{baseid}","#{custid}")
EOS

    properties.each do |p,v|
      jass += <<-EOS
  //! i makechange(current,"#{p}","#{[v].flatten.join(",")}")
EOS
    end

    jass += <<-EOS
//! endexternalblock
EOS
  end

  def create_item(baseid, custid, properties)
    create_object("items", baseid, custid, properties)
  end

  def create_unit(baseid, custid, properties)
    create_object("units", baseid, custid, properties)
  end
end
