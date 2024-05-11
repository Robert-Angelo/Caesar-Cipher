 (defconstant +alphabet+ "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz")
(defun encrypt (txt shift)
(map 'string #'(lambda (x)
(if (find x +alphabet+)(
char +alphabet+ (mod (+ (position x +alphabet+) (* 2 shift)) 52))x))txt))
;; Map  lambda function only if character x is in the constant of alphabet 
(defun decrypt (txt shift) (encrypt txt (* shift -1)))
(defun solve (txt)
  (labels ((shift (n)
             (when (< n 26)
               (let ((decrypted (decrypt txt n)))
                 (format t "Shift ~d: ~a~%" n decrypted)
                 (shift (1+ n))))))
    (shift 0)))
