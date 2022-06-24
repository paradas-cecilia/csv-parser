;; CSV to SQL parsing library.

;; The character used to indicate the end of a field
;; in a CSV file.
(define *field-separator*  #\;)

;;The character used to protect embedded field separators
;;(usually commas) and whitespace within a field.
;;To import the *quote-character* itself, you must have
;;it printed twice in the input stream.
(define *quote-character* #\")

;;Holds a function which knows how to handle chars based
;;on what we've seen so far.
(define *state* nil)

;;Keeps track of how many blanks have been skipped.  When emitting
;;a field, we can trim extra right spaces, if appropriate, using this.
(define *spaces-gobbled* nil)

;;Holds the field we are currently working on.
(define *current-field* nil)

;;Holds the fields we have collected/parsed so far.
(define *fields* nil)

;;Holds the number of fields we have collected/parsed so far.
(define *num-fields* 0)

;;Read one line form a stream containing CSV data.
;;Returns two values; a list of strings parsed, and
;;the number of parsed values.
(define (read-csv-line stream)
  (let ([*state* 'skip-white-space]
        [*space-gobbled* 0]
        [*fields* '()]
        [*num-fields* 0]
        [*current-field* (make-empty-field)])

    )
  )

;  States:
;;    * skip-white-space (initial state).
;;    * regular-field    handle things like ` foo bar '
;;    * got-first-quote  handle things like ` " foo X'
;;    * got-second-quote handle things like ` " foo  "X '
;;
(define (skip-white-space))
