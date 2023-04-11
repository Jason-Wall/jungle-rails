describe('Home page', () => {
  beforeEach(() => {
    cy.visit('localhost:3000');
  });

  it('Loads the title banner', () => {
    cy.get('.title')
      .find('h1')
      .should('have.text', 'The Jungle');
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

}

);