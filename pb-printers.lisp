(in-package :tensorflow.protobuf)

(cl:defmethod cl:print-object ((self tensor-proto) stream)
  (cl:pprint-logical-block (stream cl:nil)
    (cl:print-unreadable-object (self stream :type cl:t :identity cl:t)
      (cl:when (cl:logbitp 0 (cl:slot-value self '%has-bits%))
        (cl:format stream " ~_dtype: ~s" (dtype self)))
      (cl:when (cl:logbitp 1 (cl:slot-value self '%has-bits%))
        (cl:format stream " ~_tensor-shape: ~s" (tensor-shape self)))
      (cl:when (cl:logbitp 2 (cl:slot-value self '%has-bits%))
        (cl:format stream " ~_version-number: ~s" (version-number self)))
      (cl:when (cl:logbitp 3 (cl:slot-value self '%has-bits%))
	(cl:let ((content (tensor-content self)))
	  (cl:if (cl:< (cl:length content) 10)
	      (cl:format stream " ~_tensor-content: ~s" content)
	      (cl:format stream " ~_tensor-content: ~s ...... (~A)" (cl:subseq content 0 10) (cl:length content)))))
      (cl:format stream " ~_half-val: ~s" (half-val self))
      (cl:format stream " ~_float-val: ~s" (float-val self))
      (cl:format stream " ~_double-val: ~s" (double-val self))
      (cl:format stream " ~_int-val: ~s" (int-val self))
      (cl:format stream " ~_string-val: ~s" (string-val self))
      (cl:format stream " ~_scomplex-val: ~s" (scomplex-val self))
      (cl:format stream " ~_int64-val: ~s" (int64-val self))
      (cl:format stream " ~_bool-val: ~s" (bool-val self))
      (cl:format stream " ~_dcomplex-val: ~s" (dcomplex-val self))
      (cl:format stream " ~_resource-handle-val: ~s" (resource-handle-val self))
      ))
  (cl:values))

