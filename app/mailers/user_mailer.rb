class UserMailer < ActionMailer::Base
  default :from => "info@openmissouri.org"
  
  def dataset_thanks_email(user, dataset)
      @user = user
      @dataset = dataset
      mail(:to => user.email,
           :subject => "Thanks for suggesting a data set to OpenMissouri!")
    end
end
