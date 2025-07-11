<%-- 
    Document   : profile_modals
    Created on : Mar 26, 2025, 11:59:38 AM
    Author     : BALWANT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Change Password Modal -->
<div class="modal fade" id="change_pass">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">

            <!-- Modal Header 
            <div class="modal-header bg-light">
                <h4 class="modal-title" style="text-align:center">Login</h4>
                
            </div>  
            -->
            <!-- Modal body -->
            <div class="modal-body" id="form" style="background:transparent;">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8">
                            <label>Current Password:</label>
                            <div id="cp-msg" style="color:red;"></div>
                            <input type="password" class=" form-control " id="current_pass" required>
                            <label>New Password:</label>
                            <div id="password-msg" style="color:red;"></div>
                            <input type="password" class=" form-control " id="new_pass" required>
                            <label>Retype Password:</label>
                            <div id="repassword-msg" style="color:red;"></div>
                            <input type="password" class=" form-control " id="repass" required><br>
                            <button  class="btn btn-dark  form-control"   id="cng_pass-btn">Submit</button><br><br>
                        </div>
                        <div class="col-lg-2">
                            <button type="button" style="color:red" class="close" id="close_pass" data-dismiss="modal">×</button>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Edit Profile Modal -->
<div class="modal fade" id="edit_profile">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <!-- <div class="modal-header bg-light">
                <h4 class="modal-title" style="text-align:center">Edit Profile</h4>
                
            </div> --> 

            <!-- Modal body -->
            <div class="modal-body" id="form" style="background:transparent;">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8">
                            <%
                                String occupation = "";
                                PreparedStatement p3 = cn.prepareStatement("select * from user_details where email=?");
                                p3.setString(1, email);
                                ResultSet r3 = p3.executeQuery();
                                if (r3.next()) {
                                    occupation = r3.getString(9);
                            %>

                            <h2 style="text-align:center;">Edit Profile</h2>
                            <label>First name</label>
                            <input type="text" id="fname" class="form-control" value="<%=r3.getString(2)%>" required ><br>
                            <label>Last name</label>
                            <input type="text" id="lname" class="form-control" value="<%=r3.getString(3)%>" required><br>
                            <label>Gender</label><br>
                            <input type="radio" class="px-4" name="gender"  value="male" <%= r3.getString(6).equals("male") ? "checked" : ""%>><span class="pr-4">Male</span>
                            <input type="radio" class="px-4" name="gender" value="female" <%= r3.getString(6).equals("female") ? "checked" : ""%> ><span>Female</span><br>
                            <br><label>Caste</label>
                            <select class="form-control dropdown" id="caste">
                                <option value="kumawat" <%= r3.getString(7).equals("kumawat") ? "selected" : ""%>>Kumawat</option>
                                <option value="sharma" <%= r3.getString(7).equals("sharma") ? "selected" : ""%>>Sharma</option>
                                <option value="gupta" <%= r3.getString(7).equals("gupta") ? "selected" : ""%>>Gupta</option>
                                <option value="swami" <%= r3.getString(7).equals("swami") ? "selected" : ""%>>Swami</option>
                                <option value="saini" <%= r3.getString(7).equals("saini") ? "selected" : ""%>>Jain</option>
                                <option value="agarwal" <%= r3.getString(7).equals("agarwal") ? "selected" : ""%>>Agarwal</option>
                                <option value="other" <%= r3.getString(7).equals("other") ? "selected" : ""%>>Other</option>
                            </select><br>

                            <label>Religion</label>
                            <select class="form-control dropdown" id="religion" name="religion">
                                <option value="Buddhism" <%= r3.getString(8).equals("Buddhism") ? "selected" : ""%>>Buddhism</option>
                                <option value="Christian" <%= r3.getString(8).equals("Christian") ? "selected" : ""%>>Christian</option>
                                <option value="Hindu" <%= r3.getString(8).equals("Hindu") ? "selected" : ""%>>Hindu</option>
                                <option value="muslim" <%= r3.getString(8).equals("muslim") ? "selected" : ""%>>Muslim</option>
                                <option value="Jain" <%= r3.getString(8).equals("Jain") ? "selected" : ""%>>Jain</option>
                                <option value="Other" <%= r3.getString(8).equals("Other") ? "selected" : ""%>>Other</option>
                            </select><br>
                            <label>occupation</label>
                            <input type="text" class="form-control" name="occupation" id="occupation" value="<%=r3.getString(9)%>" required><br>
                            <label>Date of Birth</label>
                            <input type="date" class="form-control" name="date" id="date" value="<%=r3.getString(10)%>"><br>
                            <label>country</label>
                            <select id="country" name="country" id="country" class="form-control">
                                <option value="<%=r3.getString(11)%>"><%=r3.getString(11)%></option>
                                <option value="Åland Islands">Åland Islands</option>
                                <option value="Albania">Albania</option>
                                <option value="Algeria">Algeria</option>
                                <option value="American Samoa">American Samoa</option>
                                <option value="Andorra">Andorra</option>
                                <option value="Angola">Angola</option>
                                <option value="Anguilla">Anguilla</option>
                                <option value="Antarctica">Antarctica</option>
                                <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                <option value="Argentina">Argentina</option>
                                <option value="Armenia">Armenia</option>
                                <option value="Aruba">Aruba</option>
                                <option value="Australia">Australia</option>
                                <option value="Austria">Austria</option>
                                <option value="Azerbaijan">Azerbaijan</option>
                                <option value="Bahamas">Bahamas</option>
                                <option value="Bahrain">Bahrain</option>
                                <option value="Bangladesh">Bangladesh</option>
                                <option value="Barbados">Barbados</option>
                                <option value="Belarus">Belarus</option>
                                <option value="Belgium">Belgium</option>
                                <option value="Belize">Belize</option>
                                <option value="Benin">Benin</option>
                                <option value="Bermuda">Bermuda</option>
                                <option value="Bhutan">Bhutan</option>
                                <option value="Bolivia">Bolivia</option>
                                <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                <option value="Botswana">Botswana</option>
                                <option value="Bouvet Island">Bouvet Island</option>
                                <option value="Brazil">Brazil</option>
                                <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                                <option value="Brunei Darussalam">Brunei Darussalam</option>
                                <option value="Bulgaria">Bulgaria</option>
                                <option value="Burkina Faso">Burkina Faso</option>
                                <option value="Burundi">Burundi</option>
                                <option value="Cambodia">Cambodia</option>
                                <option value="Cameroon">Cameroon</option>
                                <option value="Canada">Canada</option>
                                <option value="Cape Verde">Cape Verde</option>
                                <option value="Cayman Islands">Cayman Islands</option>
                                <option value="Central African Republic">Central African Republic</option>
                                <option value="Chad">Chad</option>
                                <option value="Chile">Chile</option>
                                <option value="China">China</option>
                                <option value="Christmas Island">Christmas Island</option>
                                <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                                <option value="Colombia">Colombia</option>
                                <option value="Comoros">Comoros</option>
                                <option value="Congo">Congo</option>
                                <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option>
                                <option value="Cook Islands">Cook Islands</option>
                                <option value="Costa Rica">Costa Rica</option>
                                <option value="Cote D'ivoire">Cote D'ivoire</option>
                                <option value="Croatia">Croatia</option>
                                <option value="Cuba">Cuba</option>
                                <option value="Cyprus">Cyprus</option>
                                <option value="Czech Republic">Czech Republic</option>
                                <option value="Denmark">Denmark</option>
                                <option value="Djibouti">Djibouti</option>
                                <option value="Dominica">Dominica</option>
                                <option value="Dominican Republic">Dominican Republic</option>
                                <option value="Ecuador">Ecuador</option>
                                <option value="Egypt">Egypt</option>
                                <option value="El Salvador">El Salvador</option>
                                <option value="Equatorial Guinea">Equatorial Guinea</option>
                                <option value="Eritrea">Eritrea</option>
                                <option value="Estonia">Estonia</option>
                                <option value="Ethiopia">Ethiopia</option>
                                <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                                <option value="Faroe Islands">Faroe Islands</option>
                                <option value="Fiji">Fiji</option>
                                <option value="Finland">Finland</option>
                                <option value="France">France</option>
                                <option value="French Guiana">French Guiana</option>
                                <option value="French Polynesia">French Polynesia</option>
                                <option value="French Southern Territories">French Southern Territories</option>
                                <option value="Gabon">Gabon</option>
                                <option value="Gambia">Gambia</option>
                                <option value="Georgia">Georgia</option>
                                <option value="Germany">Germany</option>
                                <option value="Ghana">Ghana</option>
                                <option value="Gibraltar">Gibraltar</option>
                                <option value="Greece">Greece</option>
                                <option value="Greenland">Greenland</option>
                                <option value="Grenada">Grenada</option>
                                <option value="Guadeloupe">Guadeloupe</option>
                                <option value="Guam">Guam</option>
                                <option value="Guatemala">Guatemala</option>
                                <option value="Guernsey">Guernsey</option>
                                <option value="Guinea">Guinea</option>
                                <option value="Guinea-bissau">Guinea-bissau</option>
                                <option value="Guyana">Guyana</option>
                                <option value="Haiti">Haiti</option>
                                <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
                                <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                                <option value="Honduras">Honduras</option>
                                <option value="Hong Kong">Hong Kong</option>
                                <option value="Hungary">Hungary</option>
                                <option value="Iceland">Iceland</option>
                                <option value="India">India</option>
                                <option value="Indonesia">Indonesia</option>
                                <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
                                <option value="Iraq">Iraq</option>
                                <option value="Ireland">Ireland</option>
                                <option value="Isle of Man">Isle of Man</option>
                                <option value="Israel">Israel</option>
                                <option value="Italy">Italy</option>
                                <option value="Jamaica">Jamaica</option>
                                <option value="Japan">Japan</option>
                                <option value="Jersey">Jersey</option>
                                <option value="Jordan">Jordan</option>
                                <option value="Kazakhstan">Kazakhstan</option>
                                <option value="Kenya">Kenya</option>
                                <option value="Kiribati">Kiribati</option>
                                <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
                                <option value="Korea, Republic of">Korea, Republic of</option>
                                <option value="Kuwait">Kuwait</option>
                                <option value="Kyrgyzstan">Kyrgyzstan</option>
                                <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
                                <option value="Latvia">Latvia</option>
                                <option value="Lebanon">Lebanon</option>
                                <option value="Lesotho">Lesotho</option>
                                <option value="Liberia">Liberia</option>
                                <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                                <option value="Liechtenstein">Liechtenstein</option>
                                <option value="Lithuania">Lithuania</option>
                                <option value="Luxembourg">Luxembourg</option>
                                <option value="Macao">Macao</option>
                                <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option>
                                <option value="Madagascar">Madagascar</option>
                                <option value="Malawi">Malawi</option>
                                <option value="Malaysia">Malaysia</option>
                                <option value="Maldives">Maldives</option>
                                <option value="Mali">Mali</option>
                                <option value="Malta">Malta</option>
                                <option value="Marshall Islands">Marshall Islands</option>
                                <option value="Martinique">Martinique</option>
                                <option value="Mauritania">Mauritania</option>
                                <option value="Mauritius">Mauritius</option>
                                <option value="Mayotte">Mayotte</option>
                                <option value="Mexico">Mexico</option>
                                <option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
                                <option value="Moldova, Republic of">Moldova, Republic of</option>
                                <option value="Monaco">Monaco</option>
                                <option value="Mongolia">Mongolia</option>
                                <option value="Montenegro">Montenegro</option>
                                <option value="Montserrat">Montserrat</option>
                                <option value="Morocco">Morocco</option>
                                <option value="Mozambique">Mozambique</option>
                                <option value="Myanmar">Myanmar</option>
                                <option value="Namibia">Namibia</option>
                                <option value="Nauru">Nauru</option>
                                <option value="Nepal">Nepal</option>
                                <option value="Netherlands">Netherlands</option>
                                <option value="Netherlands Antilles">Netherlands Antilles</option>
                                <option value="New Caledonia">New Caledonia</option>
                                <option value="New Zealand">New Zealand</option>
                                <option value="Nicaragua">Nicaragua</option>
                                <option value="Niger">Niger</option>
                                <option value="Nigeria">Nigeria</option>
                                <option value="Niue">Niue</option>
                                <option value="Norfolk Island">Norfolk Island</option>
                                <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                <option value="Norway">Norway</option>
                                <option value="Oman">Oman</option>
                                <option value="Pakistan">Pakistan</option>
                                <option value="Palau">Palau</option>
                                <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                                <option value="Panama">Panama</option>
                                <option value="Papua New Guinea">Papua New Guinea</option>
                                <option value="Paraguay">Paraguay</option>
                                <option value="Peru">Peru</option>
                                <option value="Philippines">Philippines</option>
                                <option value="Pitcairn">Pitcairn</option>
                                <option value="Poland">Poland</option>
                                <option value="Portugal">Portugal</option>
                                <option value="Puerto Rico">Puerto Rico</option>
                                <option value="Qatar">Qatar</option>
                                <option value="Reunion">Reunion</option>
                                <option value="Romania">Romania</option>
                                <option value="Russian Federation">Russian Federation</option>
                                <option value="Rwanda">Rwanda</option>
                                <option value="Saint Helena">Saint Helena</option>
                                <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                                <option value="Saint Lucia">Saint Lucia</option>
                                <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                                <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
                                <option value="Samoa">Samoa</option>
                                <option value="San Marino">San Marino</option>
                                <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                                <option value="Saudi Arabia">Saudi Arabia</option>
                                <option value="Senegal">Senegal</option>
                                <option value="Serbia">Serbia</option>
                                <option value="Seychelles">Seychelles</option>
                                <option value="Sierra Leone">Sierra Leone</option>
                                <option value="Singapore">Singapore</option>
                                <option value="Slovakia">Slovakia</option>
                                <option value="Slovenia">Slovenia</option>
                                <option value="Solomon Islands">Solomon Islands</option>
                                <option value="Somalia">Somalia</option>
                                <option value="South Africa">South Africa</option>
                                <option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option>
                                <option value="Spain">Spain</option>
                                <option value="Sri Lanka">Sri Lanka</option>
                                <option value="Sudan">Sudan</option>
                                <option value="Suriname">Suriname</option>
                                <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                                <option value="Swaziland">Swaziland</option>
                                <option value="Sweden">Sweden</option>
                                <option value="Switzerland">Switzerland</option>
                                <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                                <option value="Taiwan">Taiwan</option>
                                <option value="Tajikistan">Tajikistan</option>
                                <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
                                <option value="Thailand">Thailand</option>
                                <option value="Timor-leste">Timor-leste</option>
                                <option value="Togo">Togo</option>
                                <option value="Tokelau">Tokelau</option>
                                <option value="Tonga">Tonga</option>
                                <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                <option value="Tunisia">Tunisia</option>
                                <option value="Turkey">Turkey</option>
                                <option value="Turkmenistan">Turkmenistan</option>
                                <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                <option value="Tuvalu">Tuvalu</option>
                                <option value="Uganda">Uganda</option>
                                <option value="Ukraine">Ukraine</option>
                                <option value="United Arab Emirates">United Arab Emirates</option>
                                <option value="United Kingdom">United Kingdom</option>
                                <option value="United States">United States</option>
                                <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                                <option value="Uruguay">Uruguay</option>
                                <option value="Uzbekistan">Uzbekistan</option>
                                <option value="Vanuatu">Vanuatu</option>
                                <option value="Venezuela">Venezuela</option>
                                <option value="Viet Nam">Viet Nam</option>
                                <option value="Virgin Islands, British">Virgin Islands, British</option>
                                <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                                <option value="Wallis and Futuna">Wallis and Futuna</option>
                                <option value="Western Sahara">Western Sahara</option>
                                <option value="Yemen">Yemen</option>
                                <option value="Zambia">Zambia</option>
                                <option value="Zimbabwe">Zimbabwe</option>
                            </select><br>
                            <label>State</label>
                            <select name="state" id="state" class="form-control">
                                <option value="<%=r3.getString(12)%>"><%=r3.getString(12)%></option>
                                <option value="Andhra Pradesh">Andhra Pradesh</option>
                                <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                <option value="Assam">Assam</option>
                                <option value="Bihar">Bihar</option>
                                <option value="Chhattisgarh">Chhattisgarh</option>
                                <option value="Goa">Goa</option>
                                <option value="Gujarat">Gujarat</option>
                                <option value="Haryana">Haryana</option>
                                <option value="Himachal Pradesh">Himachal Pradesh</option>
                                <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                <option value="Jharkhand">Jharkhand</option>
                                <option value="Karnataka">Karnataka</option>
                                <option value="Kerala">Kerala</option>
                                <option value="Madhya Pradesh">Madhya Pradesh</option>
                                <option value="Maharashtra">Maharashtra</option>
                                <option value="Manipur">Manipur</option>
                                <option value="Meghalaya">Meghalaya</option>
                                <option value="Mizoram">Mizoram</option>
                                <option value="Nagaland">Nagaland</option>
                                <option value="Odisha">Odisha</option>
                                <option value="Punjab">Punjab</option>
                                <option value="Rajasthan">Rajasthan</option>
                                <option value="Sikkim">Sikkim</option>
                                <option value="Tamil Nadu">Tamil Nadu</option>
                                <option value="Telangana">Telangana</option>
                                <option value="Tripura">Tripura</option>
                                <option value="Uttarakhand">Uttarakhand</option>
                                <option value="Uttar Pradesh">Uttar Pradesh</option>
                                <option value="West Bengal">West Bengal</option>
                                <option value="Chandigarh">Chandigarh</option>
                                <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
                                <option value="Daman and Diu">Daman and Diu</option>
                                <option value="Delhi">Delhi</option>
                                <option value="Lakshadweep">Lakshadweep</option>
                                <option value="Puducherry">Puducherry</option>

                            </select><br>
                            <label>City</label>
                            <select  name="city" class="form-control" id="city">
                                <option value="<%=r3.getString(13)%>"><%=r3.getString(13)%></option>
                                <option value="ajmer">Ajmer</option>
                                <option value="alwar">Alwar</option>
                                <option value="banswara">Banswara</option>
                                <option value="baran">Baran</option>
                                <option value="barmer">Barmer</option>
                                <option value="bharatpur">Bharatpur</option>
                                <option value="bhilwara">Bhilwara</option>
                                <option value="bikaner">Bikaner</option>
                                <option value="bundi">Bundi</option>
                                <option value="chittorgarh">Chittorgarh</option>
                                <option value="churu">Churu</option>
                                <option value="dausa">Dausa</option>
                                <option value="dholpur">Dholpur</option>
                                <option value="dungarpur">Dungarpur</option>
                                <option value="hanumangarh">Hanumangarh</option>
                                <option value="jaipur">Jaipur</option>
                                <option value="jaisalmer">Jaisalmer</option>
                                <option value="jalore">Jalore</option>
                                <option value="jhalawar">Jhalawar</option>
                                <option value="jhunjhunu">Jhunjhunu</option>
                                <option value="jodhpur">Jodhpur</option>
                                <option value="karauli">Karauli</option>
                                <option value="kota">Kota</option>
                                <option value="nagaur">Nagaur</option>
                                <option value="pali">Pali</option>
                                <option value="pratapgarh">Pratapgarh</option>
                                <option value="rajsamand">Rajsamand</option>
                                <option value="sawai madhopur">Sawai Madhopur</option>
                                <option value="sikar">Sikar</option>
                                <option value="sirohi">Sirohi</option>
                                <option value="sri ganganagar">Sri Ganganagar</option>
                                <option value="tonk">Tonk</option>
                                <option value="udaipur">Udaipur</option>
                            </select><br><br>
                            <button class="btn btn-info" id="update-btn">Update</button>
                            <%
                                }
                            %>
                        </div>
                        <div class="col-lg-2">
                            <button type="button" style="color:red" class="close" id="close_pass" data-dismiss="modal">×</button>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Change Profile Picture Modal -->
<!-- UPLOAD PROFILE MODEL -->
<div class="modal fade" id="p_upload">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">

            <!-- Modal Header 
            <div class="modal-header bg-light">
                <h4 class="modal-title" style="text-align:center">Login</h4>
                
            </div>  
            -->
            <!-- Modal body -->
            <div class="modal-body" id="form" style="background:transparent;">
                <div class="card-body">
                    <button type="button" style="color:red" class="close"  data-dismiss="modal">×</button>
                    <div class="container mt-4">
                        <h2>Crop & Upload Profile Picture</h2>
                        <input type="file" id="inputImage" accept="image/*" class="form-control">
                        <div>
                            <img id="imagePreview">
                        </div>
                        <div class="preview-box">
                            <div class="preview"></div>
                        </div>
                        <button id="cropButton" class="btn btn-primary mt-2">Crop & Upload</button>
                        <div id="croppedImageResult"></div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
