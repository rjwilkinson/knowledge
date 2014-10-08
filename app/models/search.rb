class Search
  attr_accessor :user_number, :postcode, :help_desk_expiry, :company_name, :error_message, :products


  def initialize(cust_num, submitted_postcode=nil)  
    begin
      #Connects to the service. A proxy is being used here so that the request can be inspected during development.
      client = Savon.client(wsdl: "http://service.microlib.co.uk/activationservice.asmx?wsdl", proxy: "http://192.168.0.106:8888")
      message = {'UserNumber' => cust_num}
      response = client.call(:request_details_v2, message: message)
      data = response.to_hash[:request_details_v2_response][:request_details_v2_result]

       #Puts each bit of data into a variable. This can be accessed and displayed in the view.
       @user_number       =   data[:user_number]
       @postcode          =   data[:postcode]
       @help_desk_expiry  =   data[:help_desk_expiry]
       @company_name      =   data[:company_name] 
       @products          =   data[:products]
       
  
    rescue => e
    @error_message = e
    
    end
  end
  
  
  # Performs a login
  def self.login(submitted_cust_num, submitted_postcode)
     @search_result = Search.new(submitted_cust_num)
    begin
      if @search_result.user_number.gsub(' ', '').downcase == submitted_cust_num.gsub(' ', '').downcase && 
         @search_result.postcode.gsub(' ', '').downcase == submitted_postcode.gsub(' ', '').downcase
        return true
      else
        return false
      end
    rescue => e
      @error_message = e
    end
  end
  
  
  
  
end
