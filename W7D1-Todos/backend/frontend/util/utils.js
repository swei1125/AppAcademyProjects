
const uniqueId = () => {
  const num = new Date();
  return num.getTime();
};

export default uniqueId;
