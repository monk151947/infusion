require "infusion/version"
require 'xmlrpc/client'
require 'pp'
require 'yaml'


module Infusion

   def self.file_path(file)
      begin
        config = YAML::load(IO.read(file))
      rescue => e
        raise "YAML configuration file couldn't be found: #{e}"
      end
      $key = config["key"]
      server = config["server"]
      $server = XMLRPC::Client.new2(server)
   end  
  
 #method for get the data from the table

   def self.data_load(table, id, selected_fields)
       attempts = 0
      begin
        main_product = $server.call("DataService.load", $key,table, id, selected_fields)
      rescue Exception
       attempts += 1
      retry unless attempts > 1000
       exit -1
      ensure
       puts "ensure! #{attempts}"
      end
   end

 # method to opt in email

    def self.optin(email, message)
     $server.call("APIEmailService.optIn", $key,email,message)
    end

 # method for find email from IS
   def self.findByEmail(email, contact_info)
   attempts = 0
      begin
        $server.call("ContactService.findByEmail", $key, email,contact_info)
      rescue Exception
        attempts += 1
      retry unless attempts > 1000
        exit -1
      ensure
       puts "ensure! #{attempts}"
      end
    end

 # method for contact add
    def self.add_contact(contact)
      attempts = 0
      begin
        $server.call("ContactService.add", $key, contact)
      rescue Exception
        attempts += 1
      retry unless attempts > 1000
        exit -1
      ensure
        puts "ensure! #{attempts}"
     end
    end

  # method for update the contact_info
    def self.update(user_id, contact)
       attempts = 0
        begin
          $server.call("ContactService.update", $key,user_id,contact)
        rescue Exception
          attempts += 1
        retry unless attempts > 1000
          exit -1
        ensure
          puts "ensure! #{attempts}"
       end
    end

 # method for merge contacts
    def self.merge(user_id, merge_id)
      attempts = 0
      begin
        $server.call("ContactService.merge", $key,user_id, merge_id)
      rescue Exception
         attempts += 1
      retry unless attempts > 1000
         exit -1
      ensure
         puts "ensure! #{attempts}"
      end
    end

 # method for add contact to campaign
    def self.campaign(results, campaign_id)
      attempts = 0
       begin
         $server.call("ContactService.addToGroup",$key,results,campaign_id)
        rescue Exception
         attempts += 1
        retry unless attempts > 1000
         exit -1
        ensure
         puts "ensure! #{attempts}"
       end
    end

# find by query this method is for to check subscription
    def self.query(query, fields)
     attempts = 0
       begin
       $server.call("DataService.query",$key,"RecurringOrder",10,0,query,fields)
       rescue Exception
         attempts += 1
        retry unless attempts > 1000
         exit -1
        ensure
        puts "ensure! #{attempts}"
       end
    end

#Find the order from contact id 
   def self.order(query, fields)
     attempts = 0
       begin
       $server.call("DataService.query",key,"Job",10,0,query,fields )
       rescue Exception
         attempts += 1
        retry unless attempts > 1000
         exit -1
        ensure
        puts "ensure! #{attempts}"
       end
   end

# Find the order iteams from order_id
  def self.orderitems(query, fields)
     attempts = 0
      begin
       $server.call("DataService.query",key,"OrderItem",10,0,query,fields )
      rescue Exception
         attempts += 1
      retry unless attempts > 1000
         exit -1
      ensure
        puts "ensure! #{attempts}"
      end
  end

# Delegate to ApiInfusionsoft::Client
  def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
  end
  

end
