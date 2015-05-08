class TestingController < ApplicationController


  layout 'templating', :only => [:handlebar]

  def index
    #awesome_log(request.path, :debug)
    #Rails.logger.info "bhai bhai bhai"
    #Rails.logger.debug "bhai bhai bhai"
    Rails.logger.info "*****************************"
    Rails.logger.debug cookies['username'].inspect
    Rails.logger.info "*****************************"
    cookies['movies'] = "Pk, DDLJ, RangDeBasanti, SaddiGali" #This will be read by the user
  end

  def test
   #render :partial => 'test', :status => 200
  end


#----------------------------------------------------------------------------------------------------------------------

  def merchants
		data = [
			{"DocumentID"=> 1,"DocumentTypeID"=>52,"DocumentName"=>"prequalApplicationForm"},
			{"DocumentID"=> 6,"DocumentTypeID"=>7,"DocumentName"=>"administrationForm"},
			{"DocumentID"=>7,"DocumentTypeID"=>8,"DocumentName"=>"processorReferences"},
			{"DocumentID"=>8,"DocumentTypeID"=>10,"DocumentName"=>"voidedCheck"},
			{"DocumentID"=>10,"DocumentTypeID"=>9,"DocumentName"=>"processorContract"},
			{"DocumentID"=>11,"DocumentTypeID"=>19,"DocumentName"=>"proofofOwnership"},
			{"DocumentID"=>12,"DocumentTypeID"=>25,"DocumentName"=>"ownerInformation"},
			{"DocumentID"=>13,"DocumentTypeID"=>51,"DocumentName"=>"achAgreement"},
			{"DocumentID"=>14,"DocumentTypeID"=>7,"DocumentName"=>"administrationForm"},
			{"DocumentID"=>15,"DocumentTypeID"=>8,"DocumentName"=>"processorReferences"},
			{"DocumentID"=>16,"DocumentTypeID"=>10,"DocumentName"=>"voidedCheck"},
			{"DocumentID"=>18,"DocumentTypeID"=>9,"DocumentName"=>"processorContract"},
			{"DocumentID"=>19,"DocumentTypeID"=>19,"DocumentName"=>"proofofOwnership"},
			{"DocumentID"=>20,"DocumentTypeID"=>25,"DocumentName"=>"ownerInformation"},
			{"DocumentID"=>21,"DocumentTypeID"=>51,"DocumentName"=>"achAgreement"}
		]
		render :json => data.to_json
  end

  def retrieve_merchants
     users = User.all
     render :json => users.to_json
  end


#----------------------------------------------------------------------------------------------------------------------


  def embedd
  end
  
  def fbtesting
  end

  def handlerbar
  end

  def upload_image
    @user = User.first
    if request.put?
      @user.avatar = params[:user][:avatar]
      @user.save!
      logger.info "Avatar: #{ @user.avatar.url }"
    end
  end

  def responsive
    render :layout => false
  end
  
  def download_file
    data = File.read(Rails.public_path + "/mgirl.jpg", :filename => 'mgirl.jpg', :type => 'application/jpg')
    #send_file(Rails.public_path + "/mgirl.jpg", :filename => 'mgirl.jpg', :type => 'application/jpg')
    send_data(data, :filename => 'mygirl.jpg')
  end
end
