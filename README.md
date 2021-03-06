# Infusion

A Ruby wrapper for Infusionsoft api

## Installation

Add this line to your application's Gemfile:

    gem 'infusion'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install infusion

## Usage
Create a file in config/config.yml add the key and server

  config:

	key: "XXXXXXXXXXXXXX"

	server: "https://yourid.infusionsoft.com:443/api/xmlrpc"

 And in your Rails Application, where you require your gem, you can add an initializer and configure like following:


config/initializers/infusion.rb 
 
    require "infusion"

    Infusion.file_path("#{Rails.root}/config/config.yml")




 Get a users first and last name using the DataService:

    Infusion.data_load('Contact', contact_id, [:FirstName, :LastName])

 Update a contact with specific field values:

    Infusion.update(contact_id, { :FirstName => 'first_name', :Email => 'test@test.com' })

 Add a new Contact:

    Infusion.add_contact({:FirstName => 'first_name', :LastName => 'last_name', :Email => 'test@test.com'})

 Merge Contact:

    Infusion.merge(contact_id, merge_contact_id)

 Method for add contact to campaign:

    Infusion.campaign(contact_id, campaign_id) 

 
 To retrive order Id from contact there is job table for order in infusionsoft:

    fields   =  ["Id", "DateCreated", "JobNotes", "JobTitle", "JobStatus"]

 Order Details of user retrieve order:

    query  =   {:ContactId =>  params[:ContactID] }

    Infusion.order(query, fields)

 To find last order_id that is latest created order:
    
    order_details.last["ID"] 

 To retrive order items from order_id :

    fields = ["ProductId", "SubscriptionPlanId", "ItemName", "Qty"]

 Order Details of user retrieve order:

    query = {:OrderId => params[:orderId]  }
    
    Infusion.orderitems(query, fields)


 Find by query this method is for to check subscription:

    fields   =  ["ProductId", "SubscriptionPlanId", "ItemName", "Qty"]

 Order Details of user retrieve all items:

    query    =   {:OrderId => params[:orderId]}

    Infusion.query(query, fields)

 Method to opt in email:

    Infusion.optin(email, message)  


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
6. Complete wiki of infusion soft API methods http://help.infusionsoft.com/api-docs/affiliateservice
7. Please report bugs. 