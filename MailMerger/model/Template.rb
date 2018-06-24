require_relative 'Tag'
require_relative 'TagFactory'

class Template
  
  attr_accessor :tags, :cuerpo

  def initialize(json)
    json = JSON.parse(json)
    datos = json['datos'].to_s
    @cuerpo = json['template'].to_s
    @tags = []
    palabras_en_el_template = json.to_s.split('>')
     
    palabras_en_el_template.each do |palabra|
      if(palabra.include? '<')
        nombre_del_tag = palabra[palabra.index('<')+1,palabra.length]
        @tags << TagFactory.get_tag_instance(nombre_del_tag, json.to_json)
      end  
    	
    end  
  end

end