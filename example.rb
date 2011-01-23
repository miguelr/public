require 'rubygems'
require 'docx_builder'
require 'active_support/core_ext/string'


file_path = "#{File.dirname(__FILE__)}/doc/form.xml"
dir_path = "#{File.dirname(__FILE__)}/doc/form"

report = DocxBuilder.new(file_path, dir_path).build do |template|
 @textoreplace = '<w:p >
		<w:r>
			<w:rPr> 
				<w:noProof/>
				<w:color w:val="000000"/>
				<w:sz w:val="20"/>
				<w:szCs w:val="20"/>
			</w:rPr>
		<w:t> y para que te digo &amp;   </w:t> 
		</w:r>
		<w:r>
    	<w:rPr>
    		<w:b/>
    		<w:noProof/>
				<w:color w:val="000000"/>
				<w:sz w:val="20"/>
				<w:szCs w:val="20"/>
    	</w:rPr>
    	<w:t> esto es la negrita</w:t>
    </w:r> 
    <w:r>
    <w:rPr> 
			<w:noProof/>
			<w:color w:val="000000"/>
			<w:sz w:val="20"/>
			<w:szCs w:val="20"/>
		</w:rPr>   
    <w:t> texto sin negrita </w:t>
    </w:r>
  </w:p><w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="2"/>
      </w:numPr>
    </w:pPr>
    <w:r><w:rPr> 
			<w:noProof/>
			<w:color w:val="000000"/>
			<w:sz w:val="20"/>
			<w:szCs w:val="20"/>
		</w:rPr>
      <w:t>One</w:t>
    </w:r> </w:p><w:p>
        <w:pPr>
          <w:pStyle w:val="ListParagraph222222"/>
          <w:numPr>
            <w:ilvl w:val="0"/>
            <w:numId w:val="2"/>
          </w:numPr>
        </w:pPr>
        <w:r><w:rPr> 
  				<w:noProof/>
  				<w:color w:val="000000"/>
  				<w:sz w:val="20"/>
  				<w:szCs w:val="20"/>
  			</w:rPr>
          <w:t>twp</w:t>
        </w:r> </w:p>'
	
	@textoreplace2 = '<w:p >
      		<w:r>
      			<w:rPr> 
      				<w:noProof/>
      				<w:color w:val="000000"/>
      				<w:sz w:val="20"/>
      				<w:szCs w:val="20"/>
      			</w:rPr>
      		<w:t> y para que te digo &amp;   </w:t> 
      		</w:r> </w:p>'
  template['xlegal']['par'] = @textoreplace #"<![PCDATA[#{@param}]]>"  
  
end
open("example.docx", "w") { |file| file.write(report) }