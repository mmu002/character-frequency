(defun character-frequency (file)
 (with-open-file (stream file)

   ;;; define variables
  (let ((content (make-string (file-length stream)))
        (arr (make-array 256 :element-type 'integer :initial-element 0)))
    (format t "file size: ~a~%" (file-length stream))

    ;;; read file into content
    (read-sequence content stream)
    (format t "file content: ~a~%" content)

    ;;; loop through each character and increase the field with the ascii code
    ;;; of the character as array subscript
    (loop for char across content do (incf (aref arr (char-code char))))

    ;;; loop through the array and print the characters on the screen
    (loop for char from 32 to 126 for i from 1 do
      (format t "~c: ~d~a~%"
              (code-char char) (aref arr char) i)))))

;;; call the procedure
(character-frequency "text.txt")
