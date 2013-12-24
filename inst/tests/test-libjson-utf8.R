context("libjson UTF-8 characters")

# Some notes: JSON defines UTF-8 as the default charset. Therefore all encoders and
# decoders are required to support UTF-8. JSON also allows for escaped unicode, i.e 
# \u00F8 however this is mostly for legacy purposes. Using actual UTF-8 characters 
# is easier and more efficient.

test_that("test that non ascii characters are ok", {
  
  if(!grepl("UTF", ignore.case=TRUE, Sys.getlocale("LC_CTYPE"))){
    warning("Current locale is not UTF! Cannot run UTF-8 tests.")
  } else { 
    #create random strings
    objects <- list(
      "Zürich",
      "北京填鴨们",
      "ผัดไทย",
      "寿司"
    );
    
    lapply(objects, function(x){
      myjson <- toJSON(x);
      expect_that(validate(myjson), is_true());
      expect_that(fromJSON(myjson), equals(x));
    });
  }
});