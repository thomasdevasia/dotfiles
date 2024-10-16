const timeSince = (date) => {
  const now = new Date();
  const postDate = new Date(date);
  const diff = now.getTime() - postDate.getTime();
  const days = Math.floor(diff / (1000 * 60 * 60 * 24));
  if (days < 1) {
    return "Today";
  } else if (days < 30) {
    return `${days} days ago`;
  } else if (days < 365) {
    return `${Math.floor(days / 30)} months ago`;
  } else {
    return `${Math.floor(days / 365)} years ago`;
  }
};

let ans = timeSince("2024-08-07T23:30:41Z"); // "Today"

console.log(ans);
