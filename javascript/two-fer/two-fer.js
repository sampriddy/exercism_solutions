var TwoFer = function () {};

TwoFer.prototype.twoFer = function (who) {
  if (who === undefined) {
    return 'One for you, one for me.';
  } else {
    return 'One for ' + who + ', one for me.';
  }
};

module.exports = TwoFer;
