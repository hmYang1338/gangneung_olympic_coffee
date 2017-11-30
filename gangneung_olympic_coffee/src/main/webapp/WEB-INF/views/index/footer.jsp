<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 <!-- Footer -->
    <footer class="footer-background">
      <div class="container">
        <div class="row">
          <div class="col-lg-10 mx-auto text-center">
            <h4>
              <strong class="footer-title"><spring:message code="site.list.top"/></strong>
            </h4>
            <br>
            <hr class="small">
             <p><span class="footer-font-white">Shin SeungYeop</span><i class="fa fa-envelope-o fa-fw tel-color"></i>
             <a href="mailto:freshman@yeopbox.com" class="tel-color">freshman@yeopbox.com</a></p>
             <p><span class="footer-font-white">Yang HyunMo</span><i class="fa fa-envelope-o fa-fw tel-color"></i>
             <a href="mailto:hyunm1338@gmail.com" class="tel-color">hyunm1338@gmail.com</a></p>
             <p><span class="footer-font-white">Joung TaeJune</span><i class="fa fa-envelope-o fa-fw tel-color"></i>
             <a href="mailto:jtj0525@naver.com" class="tel-color">jtj0525@naver.com</a></p>
            
            <!-- <ul class="list-unstyled">
              <li>
                <i class="fa fa-phone fa-fw"></i>
                (123) 456-7890</li>
              <li>
                <i class="fa fa-envelope-o fa-fw"></i>
                <a href="mailto:name@example.com">name@example.com</a>
              </li>
            </ul>
            <br> -->
            <hr class="small">
            <br>
            <p class="text-muted">Copyright &copy; 2017 <spring:message code="site.footer.teamName"/></p>
          </div>
        </div>
      </div>
      <a id="to-top" href="#top" class="btn btn-dark btn-lg js-scroll-trigger">
        <i class="fa fa-chevron-up fa-fw fa-1x"></i>
      </a>
    </footer>