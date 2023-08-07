

import SwiftUI
import CoreData
import CoreLocation
import Combine
@available(iOS 15.0, *)
   var showingAlert = false
      var errormsg = ""

      
@available(iOS 13.0, *)
public class validation_new {
    @State var showingAlert = false
   let UserNameLimit = 5
      @State private var name = ""
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
   
      if name.count > 4 {
                                    name = String(name.prefix(4))
                                }
   }
    
    
    // func limitPhoneNo(_ upper: Int) {
    //     if phoneNumber.count > upper {
    //         phoneNumber = String(phoneNumber.prefix(upper))
    //     }
    // }
    
    // func limitPincode(_ upper: Int) {
    //     if pincode.count > upper {
    //         pincode = String(pincode.prefix(upper))
    //     }
  //}
  
   
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



