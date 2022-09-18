<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HomeService.Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls"  TagPrefix="FTB" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <script type="text/javascript">  
            function validate() {  
                var doc = document.getElementById('Richtextbox');  
                if (doc.value.length == 0) {  
                    alert('Please Enter data in Richtextbox');  
                    return false;  
                }  
            }  
        </script> 

     <div class ="container-{breakpoint}">

     

            

            <div class="row">

     <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
       
                    <img  src="assets/img/Black%20and%20White%20Feminine%20Real%20Estate%20Logo.png" width="800" height="800"/>
            
      <%--<h1>Welcome to Home Services </h1>--%>
<%--      <h2>We are a team that offers a set of services to help you in your life.</h2>--%>
     <%-- <a href="#about" class="btn-get-started scrollto">Get Started</a>--%>
    </div>
     
  </section><!-- #hero -->
<br /><br />
  <main id="main">
      
    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="section-title">
          <h2>
              <asp:Localize ID="Localize56" runat="server" meta:resourceKey="AboutUs" Text="About Us"></asp:Localize></h2>
        
        </div>

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2">
              
            <img src="assets/img/about.png" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1">
            <h3><asp:Localize ID="Localize1" runat="server" meta:resourceKey="whoAreWe" Text="Who are we"></asp:Localize></h3>
            <p class="fst-italic">
                <asp:Localize ID="Localize2" runat="server" meta:resourceKey="whoAreWe1" Text="Our company began providing its services to the Saudi market since 1443 AH corresponding to 2021 AD, when it obtained a license from the Ministry of Labor.
                We provide trained and specialized manpower solutions according to the needs of business and home sector clients."></asp:Localize>
            
            </p>
          <br />
              <h3>
                  <asp:Localize ID="Localize4" runat="server"  meta:resourceKey="ourVision" Text="Our vision" ></asp:Localize></h3>
            <p class="fst-italic">
                <asp:Localize ID="Localize3" runat="server" meta:resourceKey="ourVision1" Text="To be the leading company in providing and managing manpower
                solutions in the Kingdom of Saudi Arabia and the Gulf Cooperation Council countries."></asp:Localize>
            
            </p>
              <br />
                 <h3>
                     <asp:Localize ID="Localize5" runat="server"  meta:resourceKey="Ourmessage" Text="Our message" ></asp:Localize></h3>
            <p class="fst-italic">
                <asp:Localize ID="Localize6" runat="server"  meta:resourceKey="Ourmessage1" Text="   Reaching the highest level of target customers' satisfaction through: Improving the quality of 
                services provided to them, the mechanism for obtaining them, and improving our company's work environment 
                by applying international standards.
                 and best professional practices in the manpower solutions sector and similar sectors."></asp:Localize>
        
            </p>
              <br />
              <h3>
                  <asp:Localize ID="Localize7" runat="server"  meta:resourceKey="Ourservices" Text="Our services"></asp:Localize> </h3>
            <ul>

              <li><i class="bi bi-check2-circle"></i>
                  <asp:Localize ID="Localize8" runat="server"  meta:resourceKey="Ourservices1" Text="Providing regular labor cadres and qualifying them for the Saudi labor market."></asp:Localize> </li>
             
                <li><i class="bi bi-check2-circle"></i>
                  <asp:Localize ID="Localize9" runat="server"  meta:resourceKey="Ourservices2" Text="The Manpower Affairs Department associated with the Ministry of Labour." ></asp:Localize> </li>
             
                <li><i class="bi bi-check2-circle"></i>
                  <asp:Localize ID="Localize10" runat="server"  meta:resourceKey="Ourservices3" Text="Payroll management and the possibility of providing medical insurance for manpower." ></asp:Localize> </li>
             
                <li><i class="bi bi-check2-circle"></i>
                  <asp:Localize ID="Localize11" runat="server"  meta:resourceKey="Ourservices4" Text="Communicate with a network of accredited international agents."></asp:Localize></li>
             
                <li><i class="bi bi-check2-circle"></i> <asp:Localize ID="Localize12" runat="server"  meta:resourceKey="Ourservices5" Text="Providing labor in record time." ></asp:Localize></li>
            
                <li><i class="bi bi-check2-circle"></i> <asp:Localize ID="Localize13" runat="server"  meta:resourceKey="Ourservices6" Text=" Providing the appropriate alternative according to the customer's desire." ></asp:Localize> </li>
            
            
            
            </ul>




            <p>
             
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Us Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container">

        <div class="section-title">
          <h2>
              <asp:Localize ID="Localize14" runat="server" meta:resourceKey="Services" Text="Services" ></asp:Localize></h2>
          <p> </p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="fas fa-home"></i></div>
              <asp:LinkButton ID="lnkmaid" class="title" runat="server" OnClick="lnkmaid_Click" meta:resourcekey="lnkmaidResource1">Maids</asp:LinkButton>
           <%-- <h4 class="title"><a href="maidService.aspx">Maids</a></h4>--%>
            <p class="description">
                <asp:Localize ID="Localize15" runat="server" meta:resourceKey="Services1" Text="All of ours maids are elite , so you can choose with confidence."></asp:Localize> </p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="fas fa-baby-carriage"></i></div>
           <asp:LinkButton ID="lnkBaby" class="title" runat="server" OnClick="lnkBaby_Click" meta:resourcekey="lnkBabyResource1">BabySitters</asp:LinkButton>
      <%--        <h4 class="title"><a href="baby.aspx">Baby sitters</a></h4>--%>
            <p class="description">
                <asp:Localize ID="Localize16" runat="server" meta:resourceKey="Services2" Text="All of ours babysitters have the experience to deal with children of all ages, so you can choose with confidence." ></asp:Localize></p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="fas fa-car"></i></div>
           <asp:LinkButton ID="lnkDrivers" class="title" runat="server" OnClick="lnkDrivers_Click" meta:resourcekey="lnkDriversResource1">Drivers</asp:LinkButton>
           <%-- <h4 class="title"><a href="driver.aspx">Drivers</a></h4>--%>
            <p class="description">
                <asp:Localize ID="Localize17" runat="server" meta:resourceKey="Services3" Text="All of ours drivers are licensed and trained to drive under all conditions, so you can choose with confidence." ></asp:Localize></p>
          </div>
          
        </div>

      </div>
    </section><!-- End Services Section -->

    <!-- ======= Call To Action Section ======= -->
    <section class="call-to-action">
      <div class="container">

        <div class="text-center">
          <h3></h3>
          <p> </p>
          <%--<a class="cta-btn" href="#"></a>--%>
        </div>

      </div>
    </section><!-- End Call To Action Section -->

    <!-- ======= Our Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="section-title">
          <h2>
              <asp:Localize ID="Localize18" runat="server" meta:resourceKey="OurPortfolio" Text="Our Portfolio"></asp:Localize></h2>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">
                  <asp:Localize ID="Localize19" runat="server" meta:resourceKey="OurPortfolio1" Text="All"></asp:Localize></li>
              <li data-filter=".filter-maid">
                  <asp:Localize ID="Localize20" runat="server" meta:resourceKey="OurPortfolio2" Text="Maid"></asp:Localize></li>
              <li data-filter=".filter-babysitter">
                  <asp:Localize ID="Localize21" runat="server" meta:resourceKey="OurPortfolio3" Text="Baby sitter"></asp:Localize></li>
              <li data-filter=".filter-driver">
                  <asp:Localize ID="Localize22" runat="server" meta:resourceKey="OurPortfolio4" Text="Driver"></asp:Localize></li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container">

          <div class="col-lg-4 col-md-6 portfolio-item filter-maid">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/maid%20(1).jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h3><a href="assets/img/portfolio/maid%20(1).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Maid 1">Maid 1</a></h3>
                <div>
                  <a href="assets/img/portfolio/maid%20(1).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Maid 1"><i class="bi bi-plus"></i></a>
                  
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-babysitter">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/baby%20sitter%20(1).jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h3><a href="assets/img/portfolio/baby%20sitter%20(1).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Baby sitter 3">Baby sitter 3</a></h3>
                <div>
                  <a href="assets/img/portfolio/baby%20sitter%20(1).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Baby sitter 3"><i class="bi bi-plus"></i></a>
                 
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-maid">
            <div class="portfolio-wrap">
                
              <img src="assets/img/portfolio/maid%20(2).jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h3><a href="assets/img/portfolio/maid%20(2).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Maid 2">Maid 2</a></h3>
                <div>
                  <a href="assets/img/portfolio/maid%20(2).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Maid 2"><i class="bi bi-plus"></i></a>
                  
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-driver">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/driver%20(1).jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h3><a href="assets/img/portfolio/driver%20(1).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Driver 2">Driver 2</a></h3>
                <div>
                  <a href="assets/img/portfolio/driver%20(1).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Driver 2"><i class="bi bi-plus"></i></a>
                  
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-babysitter">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/baby%20sitter%20(2).jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h3><a href="assets/img/portfolio/baby%20sitter%20(2).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Baby sitter 2">Baby sitter 2</a></h3>
                <div>
                  <a href="assets/img/portfolio/baby%20sitter%20(2).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Baby sitter 2"><i class="bi bi-plus"></i></a>
                
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-maid">
            <div class="portfolio-wrap">
                
              <img src="assets/img/portfolio/maid%20(3).jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h3><a href="assets/img/portfolio/maid%20(3).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Maid 3">Maid 3</a></h3>
                <div>
                  <a href="assets/img/portfolio/maid%20(3).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Maid 3"><i class="bi bi-plus"></i></a>
                  
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-driver">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/driver%20(2).jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h3><a href="assets/img/portfolio/driver%20(2).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Driver 1">Driver 1</a></h3>
                <div>
                  <a href="assets/img/portfolio/driver%20(2).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Driver 1"><i class="bi bi-plus"></i></a>
                 
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-driver">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/driver%20(3).jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h3><a href="assets/img/portfolio/driver%20(3).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Driver 3">Driver 3</a></h3>
                <div>
                  <a href="assets/img/portfolio/driver%20(3).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Driver 3"><i class="bi bi-plus"></i></a>
                 
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-babysitter">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/baby%20sitter%20(3).jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h3><a href="assets/img/portfolio/baby%20sitter%20(3).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Baby sitter 1">Baby sitter 1</a></h3>
                <div>
                  <a href="assets/img/portfolio/baby%20sitter%20(3).jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Baby sitter 1"><i class="bi bi-plus"></i></a>
                 
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Our Portfolio Section -->

    <!-- ======= Frequently Asked Questions Section ======= -->
    <section id="faq" class="faq section-bg">
      <div class="container">

        <div class="section-title">
          <h2>
              <asp:Localize ID="Localize23" runat="server" meta:resourceKey="FrequentlyAskedQuestions" Text="Frequently Asked Questions"></asp:Localize></h2>
        </div>

        <ul class="faq-list">

          <li>
            <div data-bs-toggle="collapse" class="collapsed question" href="#faq1"> <asp:Localize ID="Localize24" runat="server" meta:resourceKey="FrequentlyAskedQuestions1" Text="Do we need  the client in the office during the signing of the contract?"></asp:Localize> <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq1" class="collapse" data-bs-parent=".faq-list">
              <p>
                  <asp:Localize ID="Localize25" runat="server" meta:resourceKey="FrequentlyAskedQuestions2" Text=" No, our service provides the contract online and facilitates the contracting process between us and the client. Therefore, we do not need the client to be in the office to sign the contract."></asp:Localize>
              

              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq2" class="collapsed question"> <asp:Localize ID="Localize26" runat="server" meta:resourceKey="FrequentlyAskedQuestions3" Text="How much does our service cost?"></asp:Localize> <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq2" class="collapse" data-bs-parent=".faq-list">
              <p>
                  <asp:Localize ID="Localize27" runat="server" meta:resourceKey="FrequentlyAskedQuestions4" Text=" Our cost depends on the service specified by the client , each service has a different price."></asp:Localize>
              

              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq3" class="collapsed question"><asp:Localize ID="Localize28" runat="server" meta:resourceKey="FrequentlyAskedQuestions5" Text="How can client pay for our service?"></asp:Localize> <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq3" class="collapse" data-bs-parent=".faq-list">
              <p>
                  <asp:Localize ID="Localize29" runat="server" meta:resourceKey="FrequentlyAskedQuestions6" Text="We have online payment service by Visa, Mada and PayPal."></asp:Localize>
               
                  </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq4" class="collapsed question"><asp:Localize ID="Localize30" runat="server" meta:resourceKey="FrequentlyAskedQuestions7" Text="If I don't like your employees, you will returned my money ?"></asp:Localize> <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq4" class="collapse" data-bs-parent=".faq-list">
              <p>
                  <asp:Localize ID="Localize31" runat="server" meta:resourceKey="FrequentlyAskedQuestions8" Text=" Because we trust our employees and their efficiency, we pledge to return the full amount if you do not like them."></asp:Localize>
              
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq5" class="collapsed question"><asp:Localize ID="Localize32" runat="server" meta:resourceKey="FrequentlyAskedQuestions9" Text=" How long does it take for the employee to arrive into  the client?"></asp:Localize> <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq5" class="collapse" data-bs-parent=".faq-list">
              <p>
                  <asp:Localize ID="Localize33" runat="server" meta:resourceKey="FrequentlyAskedQuestions10" Text="After signing the contract and payment, it takes one to two weeks for the employee to arrive into the client."></asp:Localize>
               
              </p>
            </div>
          </li>

          

        </ul>

      </div>
    </section><!-- End Frequently Asked Questions Section -->

    <!-- ======= Our Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <h2>
              <asp:Localize ID="Localize34" runat="server"  meta:resourceKey="OurTeam" Text="Our Team"></asp:Localize></h2>
          <p> <asp:Localize ID="Localize35" runat="server"  meta:resourceKey="OurTeam1" Text="Trainees at King Fahd Medical City."></asp:Localize></p></div>

        <div class="row gy-4">
          <div class="col-lg-4 col-md-6">
            <div class="member">
                
              <img src="assets/img/team/154901-OV13BH-873.jpg" alt="">
              <h4><asp:Localize ID="Localize36" runat="server"  meta:resourceKey="member1" Text="Ghazwah aldaihani"></asp:Localize></h4>
              <span>855</span>
              <p>
                  <asp:Localize ID="Localize37" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member">
              <img src="assets/img/team/154901-OV13BH-873.jpg" alt="">
              <h4><asp:Localize ID="Localize44" runat="server"  meta:resourceKey="member2" Text="Raneem Alfehaid"></asp:Localize></h4>
              <span>869</span>
              <p>
               <asp:Localize ID="Localize38" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member">
              <img src="assets/img/team/154901-OV13BH-873.jpg" alt="">
              <h4><asp:Localize ID="Localize45" runat="server"  meta:resourceKey="member3" Text="Rahaf Talal"></asp:Localize> </h4>
              <span>1456</span>
              <p>
                 <asp:Localize ID="Localize39" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

             <div class="col-lg-4 col-md-6">
            <div class="member">
              <img src="assets/img/team/154901-OV13BH-873.jpg" alt="">
              <h4><asp:Localize ID="Localize46" runat="server"  meta:resourceKey="member4" Text="Najed Hamad "></asp:Localize></h4>
              <span>1354</span>
              <p>
                 <asp:Localize ID="Localize40" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>
             <div class="col-lg-4 col-md-6">
            <div class="member">
              <img src="assets/img/team/154901-OV13BH-873.jpg" alt="">
              <h4><asp:Localize ID="Localize47" runat="server"  meta:resourceKey="member5" Text="Renad  Munif"></asp:Localize></h4>
              <span>1469</span>
              <p>
                <asp:Localize ID="Localize41" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>
             <div class="col-lg-4 col-md-6">
            <div class="member">
              <img src="assets/img/team/154901-OV13BH-873.jpg" alt="">
              <h4><asp:Localize ID="Localize48" runat="server"  meta:resourceKey="member6" Text="Ashwaq Alshalahi"></asp:Localize></h4>
              <span>1204</span>
              <p>
                 <asp:Localize ID="Localize42" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>
             <div class="col-lg-4 col-md-6">
            <div class="member">
              <img src="assets/img/team/154901-OV13BH-873.jpg" alt="">
              <h4><asp:Localize ID="Localize49" runat="server"  meta:resourceKey="member7" Text="Fatemah Awadh"></asp:Localize> </h4>
              <span>1468</span>
              <p>
                <asp:Localize ID="Localize43" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Our Team Section -->

    <!-- ======= Contact Us Section ======= -->
    <section id="contact" class="contact section-bg">
      <div class="container">

        <div class="section-title">
          <h2>
              <asp:Localize ID="Localize50" runat="server"  meta:resourceKey="ContactUs" Text="Contact Us"></asp:Localize></h2>
         <p> <pte><asp:Localize ID="Localize51" runat="server"  meta:resourceKey="ContactUs1" Text="If you have any questions about our services, please contact us."></asp:Localize></pte></p>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="contact-about">
              <h3> <asp:Localize ID="Localize52" runat="server"  meta:resourceKey="HomeServices" Text="Home Services"></asp:Localize></h3>
              <p> <asp:Localize ID="Localize53" runat="server"  meta:resourceKey="ContactUs3" Text="Providing its services in providing trained and specialized manpower solutions according to the needs of business and home sector clients as a comfort and resident service."></asp:Localize></p>
              <div class="social-links">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="info">
              <div>
                <i class="bi bi-geo-alt"></i>
                <p> <asp:Localize ID="Localize54" runat="server"  meta:resourceKey="ContactUs4" Text="Sulaymaniyah <br>59046 Riyadh 11525s"></asp:Localize></p>
              </div>

              <div>
                <i class="bi bi-envelope"></i>
                <p>internkfmc2021@gmail.com</p>
              </div>

              <div>
                <i class="bi bi-phone"></i>
                <p>8001277000</p>
              </div>

            </div>
          </div>

          <div class="col-lg-5 col-md-12">
             
        <%-- <h2><%: Title %>.</h2>--%>
        <fieldset class="InputForm">
            <legend><strong>
                <asp:Localize ID="Localize55" runat="server" meta:resourceKey="ContactUs5" Text="Contact Us"></asp:Localize></strong></legend>
            <asp:Label ID="lblOutput" runat="server" Text=" " CssClass="myFormOutput" meta:resourcekey="lblOutputResource1"></asp:Label><br />

            <asp:Label ID="lblFrom" runat="server" Text=" From -Email:" CssClass="myFormCaption" meta:resourcekey="lblFromResource1"></asp:Label>
            <asp:TextBox ID="txtSenderEmail" CssClass="form-control" runat="server" Height="38px" Width="450px" meta:resourcekey="txtSenderEmailResource1"></asp:TextBox>

            <asp:Label ID="lblSubject" runat="server" Text=" Subject:" CssClass="myFormCaption" meta:resourcekey="lblSubjectResource1"></asp:Label>
            <asp:TextBox ID="txtSubject" CssClass="form-control"  runat="server" Width="450px" TabIndex="1" meta:resourcekey="txtSubjectResource1"></asp:TextBox>

            <asp:Label ID="lblFileAttachments" runat="server" Text="File Attachments:" CssClass="myFormCaption" meta:resourcekey="lblFileAttachmentsResource1"></asp:Label>
            <asp:FileUpload ID="FileUpload" runat="server"
                AllowMultiple="True" Width="449px" TabIndex="2" meta:resourcekey="FileUploadResource1" />
            <br />

            <asp:Label ID="lblMessage" runat="server" Text=" Message:" CssClass="myFormCaption" meta:resourcekey="lblMessageResource1"></asp:Label>
            <FTB:FreeTextBox ID="Richtextbox" runat="server" Height="200px" Width="450px" AllowHtmlMode="False" AssemblyResourceHandlerPath="" AutoConfigure="" AutoGenerateToolbarsFromString="True" AutoHideToolbar="True" AutoParseStyles="True" BackColor="158, 190, 245" BaseUrl="" BreakMode="Paragraph" ButtonDownImage="False" ButtonFileExtention="gif" ButtonFolder="Images" ButtonHeight="20" ButtonImagesLocation="InternalResource" ButtonOverImage="False" ButtonPath="" ButtonSet="NotSet" ButtonWidth="21" ClientSideTextChanged="" ConvertHtmlSymbolsToHtmlCodes="False" DesignModeBodyTagCssClass="" DesignModeCss="" DisableIEBackButton="False" DownLevelCols="50" DownLevelMessage="" DownLevelMode="TextArea" DownLevelRows="10" EditorBorderColorDark="Gray" EditorBorderColorLight="Gray" EnableHtmlMode="True" EnableSsl="False" EnableToolbars="True" Focus="False" FormatHtmlTagsToXhtml="True" GutterBackColor="129, 169, 226" GutterBorderColorDark="Gray" GutterBorderColorLight="White" HelperFilesParameters="" HelperFilesPath="" HtmlModeCss="" HtmlModeDefaultsToMonoSpaceFont="True" ImageGalleryPath="~/images/" ImageGalleryUrl="ftb.imagegallery.aspx?rif={0}&amp;cif={0}" InstallationErrorMessage="InlineMessage" JavaScriptLocation="InternalResource" Language="en-US" PasteMode="Default" ReadOnly="False" RemoveScriptNameFromBookmarks="True" RemoveServerNameFromUrls="True" RenderMode="NotSet" ScriptMode="External" ShowTagPath="False" SslUrl="/." StartMode="DesignMode" StripAllScripting="False" SupportFolder="/aspnet_client/FreeTextBox/" TabIndex="-1" TabMode="InsertSpaces" Text="" TextDirection="LeftToRight" ToolbarBackColor="Transparent" ToolbarBackgroundImage="True" ToolbarImagesLocation="InternalResource" ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage,InsertRule|Cut,Copy,Paste;Undo,Redo,Print" ToolbarStyleConfiguration="NotSet" UpdateToolbar="True" UseToolbarBackGroundImage="True">  
                            </FTB:FreeTextBox><br />
               <asp:Button ID="btnSendMailViaMailMgr"  runat="server" class="btn btn-lg btn-block btn-success" OnClick="btnSendMailViaMailMgr_Click" 
                Text="Send " TabIndex="4" meta:resourcekey="btnSendMailViaMailMgrResource1"  />
            <asp:Button ID="btnClear" runat="server"  class="btn btn-lg btn-block btn-success" OnClick="btnClear_Click" Text="Clear" meta:resourcekey="btnClearResource1"  />
        </fieldset>
    </div>
            <%--<form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="form-group">
                <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
              </div>
              <div class="form-group mt-3">
                <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
              </div>
              <div class="my-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>
          </div>

        </div>--%>

     
    </section><!-- End Contact Us Section -->

    <!-- ======= Map Section ======= -->
    <section class="map">
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3625.1514157346073!2d46.706012284841364!3d24.
          687321158254633!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3e2f03aeb5a7cefb%3A0xfcab700cf57c8f26!
          2z2YXYs9iq2LTZgdmJINin2YTZhdmE2YMg2YHZh9iv!5e0!3m2!1sar!2ssa!4v1637170016045!5m2!1sar!2ssa" frameborder="0" style="border:0;" allowfullscreen=""></iframe>

    </section><!-- End Map Section -->
    
  </main><!-- End #main -->
   
</div></div>
    

</asp:Content>
