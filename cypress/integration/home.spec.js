describe('Home page', () => {
  beforeEach(() => {
    cy.visit('localhost:3000');
  });

  it('loads the title banner', () => {
    cy.get('.title')
      .find('h1')
      .should('have.text', 'The Jungle');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

}

);