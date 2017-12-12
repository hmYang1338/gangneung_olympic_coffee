<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 <!-- Services -->
    <section id="services" class="services text-center">
    <br>
      <h2><spring:message code="site.main.bestFriend" /></h2>
      <br>
      <div class="container">
        <div class="row text-center">
          <div id="storeListView" class="store-background">
          <!-- 여기에 storeList가 나타납니다. -->
          </div>
          <!-- /.col-lg-10 -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container -->
    </section>

    <!-- Callout -->
    <aside class="callout store-background-blur" id="store-background-blur">
      <div class="text-center store-div" id="storeView">
      <!-- 여기에 store가 나타납니다 -->
      </div>
    </aside>
    
    <div id='store-content' class='store-content detail-background'>
    <!-- 여기에 store image가 나타납니다. -->
    </div>
