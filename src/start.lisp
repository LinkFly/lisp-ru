(asdf:load-system :hunchentoot)
(asdf:load-system :cl-who)

(defpackage :my-simple-site
  (:use :cl :hunchentoot))
(in-package :my-simple-site)

(defun home-page (request)
  (declare (ignore request))
  (who:with-html-output-to-string (*standard-output* nil :prologue t)
    (:html
      (:head
        (:title "Domain lisp.ru")
        (:style "body {display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; font-family: Arial, sans-serif; background-color: #f4f4f4;} h1 {text-align: center; font-size: 24px; color: #333;}"))
      (:body
        (:h1 "Domain lisp.ru has been caught by incognito ;)")))))

(defvar *my-server* (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 80)))

(hunchentoot:define-easy-handler (home :uri "/") ()
  (home-page *request*))

(format t "Сервер запущен на http://localhost:80~%")
