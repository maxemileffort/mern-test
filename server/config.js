const config = {
  mongoURL: process.env.MONGO_URL || 'mongodb://admin:admin123@ds135952.mlab.com:35952/max-test',
  port: process.env.PORT || 8000,
};

export default config;
