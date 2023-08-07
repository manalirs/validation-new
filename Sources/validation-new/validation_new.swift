

import SwiftUI
import CoreData
import CoreLocation
import Combine
@available(iOS 15.0, *)
   var showingAlert = false
      var errormsg = ""

      

public class validation_new {
   
   var name = String()
    var phoneNumber = String()
   var pincode = String()
 //     var errormsg = ""
    public init() {}
      
     public func Validation(name: String,pincode:String,phoneNumber:String,email:String) -> String? {      
         let errorMessage = String()
                // if let errorMessage = Validation(name: name, pincode: pincode) {
                //     print(errorMessage)
                //     return
                // }
                
        if name.count == 0 {
            errormsg = "Enter Correct UserName"
        }
        else  if  !isValiphoneNumber(phoneNumber){
            errormsg = "Enter correct phone number"
        }
        else  if !isValidEmail(email) {
            errormsg =  "Enter Correct Email"

        }
        else if  pincode.count != 6 {
            errormsg = "Enter Correct PINCODE"
            
        }
        else if pincode.count == 6  && pincode.count != 0 {
     
             getloc(pincode: pincode)
             let cityName = UserDefaults.standard.string(forKey: "cityName")!
                print("city--\(cityName )")
            errormsg = "Form Submitted Successfully"
        }
        else {
            errormsg = ""
        }
        return errormsg
    }
    
      public func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
  
    public func isValiphoneNumber(_ phoneNumber: String) -> Bool {
        let phoneNumberRegEx = "^\\d{3}\\d{3}\\d{4}$"
        let phoneNumberPred = NSPredicate(format:"SELF MATCHES %@", phoneNumberRegEx)
        return phoneNumberPred.evaluate(with: phoneNumber)
    }
  

 public  func limitUserName(name1: String)-> String {
   name = name1
      if name1.count > 16 {
                                    name = String(name1.prefix(16))
                                }
    return name
   }
    public  func limitPhoneNo(phoneNumber1: String)-> String {
   phoneNumber = phoneNumber1
      if phoneNumber1.count > 10 {
                                    phoneNumber = String(phoneNumber1.prefix(10))
                                }
    return phoneNumber
   }
     
   public  func limitPincode(pincode1: String)-> String {
   pincode = pincode1
      if pincode1.count > 6 {
                                    pincode = String(pincode1.prefix(6))
                                }
    return pincode
   }
       
  
  
   
   public func getloc(pincode: String) {
            var cityName = ""
            let location: String = pincode
            let geocoder: CLGeocoder = CLGeocoder()
            geocoder.geocodeAddressString(location, completionHandler: {(placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if ((placemarks?.count)! > 0) {
                    let placemark: CLPlacemark = (placemarks?[0])!
                    
                    cityName = placemark.locality!
                    UserDefaults.standard.set(cityName, forKey: "cityName")
                
                }
            } )
        }
 

}
      @available(iOS 15.0, *)
      extension View {
      
  public func vv()-> some View {
         
  frame(width: 200, height: 30, alignment: .center)
              .textFieldStyle(RoundedBorderTextFieldStyle()) .font(Font.system(size: 20))
                 .padding(.all)
        // .onReceive(Just(name)) { _ in let u = validation_new().limitUserName(UserNameLimit, name: name) }
         
        
  }
     
}



