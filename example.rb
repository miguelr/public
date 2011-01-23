require 'rubygems'
require 'docx_builder'
require 'active_support/core_ext/string'


file_path = "#{File.dirname(__FILE__)}/doc/form.xml"
dir_path = "#{File.dirname(__FILE__)}/doc/form"

report = DocxBuilder.new(file_path, dir_path).build do |template|
  @hola = "hola mundo"
  
  @texto2 = "<p><span style='color: #888888;'>CEDARWOOD ANALISTnfsfsfafsf fas ff wff qwf</span></p> <p><strong>&nbsp;wfwefqwf w</strong> gergergreg </p> "
  @texto_good = "esto esta bien 1 uno & pero uno dos $$  <b> hooola </b> "

  #"<![CDATA[#{@texto_good}]]>"
  
  @para = " <w:t>texto dinamico xs skskm </w:t>"
  
  @plaintext = "The Fund established a fair value for the Amended Series D Preferred Stock of $3,956,000, an amount equal to the stated value of the Fund’s shares based on an estimate of ultimately recoverable amounts.  The Fund’s September 30, 2010 valuation of the Series D Preferred Stock is based on the assumption that it can be repaid in full through a sale of the Company.  Alternatively, the Fund believes that they will be repaid according to the automatic monthly conversion outlined in the Amended Series D Certificate.<w:p/>As of June 30, 2010, a discounted cash flow analysis completed by the Fund, based on management projections, estimated enterprise value of the Company to be $27.5 million.  The Fund’s discounted cash flow analysis assumes a discount rate of 11.7%.  The Fund’s enterprise value estimate is sufficient to repay, through a sale of the Company, net debt, accounts payable and accrued expenses, and the stated value of preferred shares (liquidation preference amount) totaling $21.2 million.  As such, the Fund estimates that the Company’s liquidation value covers claims of all debt holders, vendors, and preferred shareholders supporting a fair value equal to the stated value amount of the Amended Series D Preferred Stock."
  
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
	
  
  template['titulo']['titulo'] = "hola mundo"
  template['legal']['legallaw'] = @plaintext
  template['xlegal']['parrafus'] = @textoreplace #"<![PCDATA[#{@param}]]>"  
  
end


open("example.docx", "w") { |file| file.write(report) }

# ... or in a Rails controller:
# response.headers['Content-disposition'] = 'attachment; filename=plan_report.docx'
# render :text => report, :content_type => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
